6PlSatneYposutor Route for
SharePoint Migration
1

To the lucky people who have been charged with planning a SharePoint migration,
I've built a career on migrations to Microsoft Sharepoint. After being a part of hundreds of migrations I can tell you that no two migrations are the same. Every organization has different data, different regulations, different business processes, and different needs. What is the same is what people want from the migration.
Everyone wants three things:  To migrate as fast as possible  To maintain data accuracy and full fidelity  To execute the migration as cheaply as possible
Here's the kicker. You can have any two of these, but you can never get all three and be successful. It's a harsh reality, but one that has come from decades of experience seeing the mistakes that organizations make in planning and executing migrations. My goal in this paper is to share the lessons I've learned over the years to help you confidently navigate the path to a successful SharePoint migration.
To do this, I've created a 6 step plan for an organization to migrate to SharePoint:
Step 1 Ensure stakeholder buy-in Step 2 Perform source platform data discovery Step 3 Categorize data and determine destinations Step 4 Design architecture to fit business processes Step 5 Determine appropriate migration approach Step 6 Predict and plan for migration duration
For each step along the path, I'll provide specific tasks, guidance, and highlight common pitfalls along the way. It's an important journey and my hope is to prepare you so you can make the trip successfully.
Wishing you a stress-free migration! Russ

Russ Houberg Sr. SharePoint MCMS Solutions Architect DryvIQ

6 Steps to Plan Your Route for SharePoint Migration

2

The Problem: The Challenges of SharePoint Migration

Why people are moving to Microsoft
It's a very common scenario today for organizations to be planning a move to Microsoft 365. This decision is typically being driven by their current cloud storage provider raising prices or because on-premises file shares have become too costly to maintain or too difficult to protect from cyber threats. In any case, it often boils down to cost. There are long-term cost savings in making the switch. The problems come in the short-term decisions on how to execute the migration.
A lack of resources and know-how makes it daunting
The first challenge that organizations face is the task of trying to figure out who can do the work. Most organizations have a skeletal IT staff that is busy running daily operations. Many organizations need two things--outside help and tools to automate the process. Accepting that reality is the first step.
Another important thing that overwhelms organizations is that there are new capabilities in Microsoft 365 that you didn't have before. This means you'll be changing processes to utilize those features and that requires changing the architecture of data storage. Add to all this that you likely have some constraints on the migration project. You might have a looming expiration date for the contract with your existing cloud provider. You likely have constraints on the amount of money spent on the migration project and related resources. All of this needs to be surfaced at the beginning of the project so appropriate planning decisions can be made.

6 Steps to Plan Your Route for SharePoint Migration

3

The Problem: The Challenges of SharePoint Migration (cont.)
Invest in early-stage planning to avoid potholes and roadblocks
The biggest problems are ones caused when organizations try to save cost or time by minimizing upfront discovery, design, and analysis.
It's like going on a road trip without any planning or navigation and being surprised when you hit construction delays while running out of gas and needing to backtrack because you went in the wrong direction.
The right move is to spend the money upfront on resources and tools that can do the detailed analysis so you know exactly what you are dealing with and can plan a route to get there safely.

Microsoft 365 has lots of products, but the ones that most organizations are
migrating their data to are Teams, OneDrive and SharePoint Online --which are all built on
the SharePoint architecture.
When we refer to a migration to
SharePoint, it refers to the decisions involved in placing data in those three buckets and how
it is done.

6 Steps to Plan Your Route for SharePoint Migration

4

Step 1 Ensure stakeholder buy-in

Getting buy-in from executives
Making a move to Microsoft 365 is typically an IT or business unit leadership decision based on costs. But like any top-down decision, in order for the organization to reap the benefits, the end-users have to actually see the value and adopt the new system. To help make this happen, the project leader needs to demonstrate the value to leadership across the organization to ensure that they will support the necessary changes, provide resources for planning and pilot, and encourage adoption in their organization. To do this, meet with each leader and be sure to point out the new capabilities that their teams will gain and discuss how it will help them do their jobs better. This is also an opportunity to discuss improved governance standards and to coach them on how they can be a good role model during the process.
Getting buy-in from support staff
Even if you are bringing in outside resources to help plan and execute the migration, internal support staff will be needed to help. Identify who these individuals will be within IT and individual business units and ensure they understand the value to their teams. The key here is to make sure they feel important as a power user and trainer. With early buy-in, you'll have them ready and willing to train users on the functionality of the new system as well as enforce new governance and content management policies.

Don't Create Shadow IT
While it might be easier at the start,
running a migration for a single business unit with shadow IT causes big problems in the long run. It is best to get buy-in from other units and IT at the start to ensure decisions are made that
work for the entire
organization.

Getting buy-in from users

Moving to a completely new operational system is a monumental change for an end user. They need time to process this and a lot of information on how bright the light is at the end of the tunnel. Far in advance of the actual migration you will want to get them excited for it. Work with internal communications to share information on the value and what will improve in their day-to-day lives. But don't hide obstacles. Make sure they understand what it will take to experience goodness at the final destination and ensure they get the training they need to get there.

6 Steps to Plan Your Route for SharePoint Migration

5

Step 2 Perform source platform data discovery

Content analysis is critical to migration planning
Most organizations lack insight into their existing storage environment. Users often store information in silos and retain content they really don't need to keep. In order to make all the important decisions that will come down the road in migration planning, you need to start with a broad and deep understanding of your data. To do this, you will need to select a migration solution that has great content analysis capabilities. The collection of all documents and folders located in any given storage platform is known as the "corpus." The constitution of the corpus can have a significant impact on transfer throughput. A detailed interrogation of the documents to be migrated will help to define the corpus and its impact on the migration project. You will need a solution that can scan the source and report out the content characteristics such as file sizes, versions, permissions, file sharing, referential links, personal information, and much more.
The 5 analysis questions you need answered
The solution you select needs to be able to get you detailed answers to the following five questions:
How many documents and/or folders are included in the migration?
SharePoint performance is optimized when documents are stored in optimal folder sizes. SharePoint will perform better and the migration will operate faster when there are as few folders as possible, while recommended folder item limits (currently 5,000 ­ related to list view threshold) are also respected. In addition to respecting Microsoft list view guidelines, following this pattern will also result in fewer folder objects and ultimately fewer API calls that need to be made to execute the migration.
What is the total storage volume and average file size of the files being migrated?
The actual amount of data that needs to be transferred will affect the duration of the migration. But what many organizations do not realize is that the average file size can have a dramatic impact on migration efficiency due to the number of API calls necessary for a given amount of data. For instance, given 100GB of data, if that 100GB consists of 10,240 10MB files, transfer throughput will be considerably higher than if that data consisted of 209,715 500KB files. This is because your migration software will have to make approximately 200,000 more API calls to transfer the 100GB of 500KB files vs 100GB of 10MB files.

6 Steps to Plan Your Route for SharePoint Migration

6

What are the departmental or taxonomic classifications of the documents?
Answering this question will help to determine how granular the site and library structure should be. When an extended number of departmental or business process-driven site and library structures are required to manage a wide variety of content types, migration configuration and execution will be more cumbersome--resulting in a longer migration project duration. That said, this can be difficult to ascertain in unstructured data unless your migration tool has the capability to identify document types such as invoices or performance reviews. The better you understand what your data is, the better you can plan where it should go.
Do versions and permissions need to be retained on the data?
Permissions are one of the biggest roadblocks in migrations. No one wants to rework permissions manually file by file. Similarly, version control is important to take stock of so you can understand what versions need to be kept or archived. It is important that your solution can report on the state of file versions and what permissions are like. This will help you determine if you need to retain those permissions or, more importantly, if you should consider refactoring those permissions as the files are migrated.
Which files contain private, personal information?
The greatest risk in data migration is not properly detecting and then protecting private, personal information. Ensure the tool you use can identify where this information exists as well as detect keywords you may use internally which would identify information that requires additional security measures.
6 Steps to Plan Your Route for SharePoint Migration

Don't cut costs with analysis
It is critical to get as much information as possible during data discovery. One of
the biggest mistakes organizations make is selecting a cheap, basic tool for this step. It saves money initially but always costs more money in the long run.
7

Step 3 Categorize data & determine destinations

Ensure you pack lightly for the journey
Migration into a new system is the perfect time to decide what really needs to come along for the ride. Instead of "lifting and shifting," a little extra planning paired with the right migration tool can enable you to restructure your content while it's in motion.
Minimizing the content planned for migration has the benefit of minimizing the planning, reducing the structure that must be deployed and the taxonomy that must be configured. Once you know you're only moving required content and leaving the "junk" out of the migration journey, you can establish better governance strategies and best practices when the new system is fully deployed.

Don't keep too much data
Most people tend to want to be
conservative when deciding on keeping, archiving or destroying data. Unfortunately, keeping too much or the wrong data will increase risk and cost. Select a tool with a cost savings estimator that can determine
potential privacy violations, unmitigated risk cost and migration costs to keep you and
your team making smart decisions.

Determine what you should take, leave or destroy
There are many different ways to determine which data should be eliminated. It is important to look at any regulatory body for your industry or any business policies on document retention and determine when content can be marked as obsolete. This can be filtered using file type, size, age, classification, or any combination. Also, consider the file creator. Many organizations choose to eliminate files created by employees that have been gone from the company for a certain number of years. Once you've determined the appropriate filters, your migration tool can work in harmony with these policies to only migrate what is relevant and filter out the rest for archival or destruction.
Minimize your risk of expensive violations
Beyond eliminating unnecessary content, you also need to ensure that you minimize the risk of privacy violations and legal issues. To do this, you'll need a tool that can detect potential issues such as personal information or information that is classified with a strict retention policy. Information that does not have a specific business value needs to be eliminated or it could be used against the organization in the event of litigation. The information that needs to be retained needs to be moved to a secured location. If not, you are at risk for significant fines should data loss occur.

6 Steps to Plan Your Route for SharePoint Migration

8

Step 4 Design architecture to fit business processes

A new journey paves the way for new opportunities at your destination
Before starting to move your content, it's critical to build the new SharePoint environment to suit your organization's needs. By doing this ahead of time, information governance strategies can be incorporated into the infrastructure so following them becomes a natural part of the user adoption process rather than an additional learning curve.
The key here is understanding that the "old" way is typically not the "best" way. SharePoint is an extremely flexible platform that is capable of twisting into a pretzel to mimic any given legacy document management solution. While that is an admirable quality of the platform, it is also an enabler for the propagation of inefficient design. Additionally, SharePoint likely has new capabilities that your current system doesn't. This means that there are opportunities to improve workflows and processes before and during migration.
Enlist users to help create the perfect destination for your data
To determine the most efficient architecture that follows Microsoft prescriptive guidance, you need to:

Don't skip over process
improvement
Despite time constraints, the migration project is your only opportunity to
improve processes. Organizations say they'll do it later, but they never do. If you don't take the time to do this, you may
be missing out on productivity
improvements and cost savings thanks to better capabilities you are now
paying for.

Engage a business analyst and power users to deconstruct business processes. Leverage the knowledge of the power users to determine if there would be a better or more efficient way to accomplish the process. Determine if the improved solution was impeded by the legacy technology and bring in a SharePoint Architect to determine if SharePoint features can facilitate the improved solution. Allow the SharePoint Architect to design an optimized solution that implements the thought leadership of the power users while leveraging the feature richness of SharePoint. Minimize custom development to facilitate maintainability and future upgrades and/or migrations.

By engaging the power users throughout solution re-envisioning, the result will yield better processes that have the benefit of immediate user adoption. This is a far better approach than just attempting to "mimic" the legacy solution using new SharePoint technology. A migration project is usually the best possible time to implement process improvement.

6 Steps to Plan Your Route for SharePoint Migration

9

Step 5 Determine appropriate migration approach

Should your journey include waves or a "big bang"?
If your migration is small, a "big bang" cutover may be the right choice. But for larger migrations, using a phased approach is typically selected. There is far too much risk in the big bang approach unless it is a small and manageable migration. That said, too many waves can cause significant collaboration and operational issues between users running on two different systems. The ideal scenario is to plan for fewer waves. Less than 5 is good, 2 3 migration waves is fantastic. Minimizing waves will improve migration efficiency and success.
Create a cutover plan and make a pilot trip
The best approach is to start with a small departmental file move first. Since IT is usually responsible for managing or even executing the migration, their own department is a suitable candidate for a pilot migration. Regardless of the group chosen, start with a small batch of users so that any hiccups with the migration are discovered early and can be ironed out (while the bulk of business operations are still being managed within your older platform) before they cause widespread chaos.
The actual pilot cutover should be a "slow walk" migration. This consists of an initial structural deployment followed by permission configuration of those structures so that migrated content can benefit from inheritance. Finally, the creation of continuous copy/ synchronization jobs facilitates the migration of the actual file content. Ideally, this should be an automated synchronization using a migration tool that continuously propagates file create, update, and delete changes from the source system to SharePoint. When the official cutover takes place, the source system is simply placed into a read-only state and a small amount of final create, update, and delete changes propagate to the destination. This method results in a smooth and relatively short cutover process that is easy to back out of in the event of an issue.

6 Steps to Plan Your Route for SharePoint Migration

10

Plan the first wave for adoption then major cutovers to complete
Once you complete the pilot, the first wave of business users should be power users that have been involved in planning and can help champion the value of SharePoint. They can also help establish a set of file sharing and governance policies as well as best practices as early adopters. Keeping the first wave fairly controlled will also help IT to resolve initial support tickets and training issues in a managed way--without causing burnout.
Plan the remaining waves by considering how departments collaborate. Place users in waves to keep them aligned with collaborators they work with most frequently to minimize business disruption. You'll need to balance this with the bandwidth and resource limitations to ensure each wave is done in a timely manner.

Don't plan too many waves
It may seem like if a few waves are good then more is better. Unfortunately the longer the migration and the more waves that occur, the more operational headache and business disruption this
causes for users trying to collaborate between two different systems.

6 Steps to Plan Your Route for SharePoint Migration

11

Step 6 Predict and plan for migration duration

You can't control everything in your migration journey
One of the most important concepts of a migration to SharePoint is that the duration of the migration can't be precisely predicted. There are many factors that affect migration duration. Some can be managed and others are out of the control of the migration team. Do your best to control what you can, but it is smart to have some buffer in the schedule to handle unplanned circumstances.
Consider critical dates to plan timing
The date that your current contract for data storage ends is of course a limiting factor in when the migration needs to take place. However, you also need to consider operational conflicts such as busy times of the year for the business. You don't want to schedule a migration wave for accounting when they are busy closing the books at the end of the fiscal year. Additionally, you need to be aware of holidays or shutdowns which may pose problems or opportunities for scheduling cutovers. And don't forget to check vacation plans for your critical IT resources who are doing the work!
Estimate duration by considering all factors
There are several important migration duration factors that should be considered when estimating how long the migration will last.
How many documents and/or folders are included in the migration? SharePoint performance is optimized when documents are stored in optimal folder sizes. SharePoint will perform better and the migration will operate faster when there are as few folders as possible, while recommended folder item limits (currently 5,000 ­ related to list view threshold) are also respected. In addition to respecting Microsoft list view guidelines, following this pattern will also result in fewer folder objects and ultimately fewer API calls that need to be made to execute the migration.

6 Steps to Plan Your Route for SharePoint Migration

12

6 Steps to Plan Your Route for SharePoint Migration

Factor in hardware and source system quality
The quality of the source system and migration hardware will affect duration either positively or negatively. It is quite common for an aging file share or legacy document management system to affect overall migration throughput due to inferior performance. It is very possible that the migration could go faster but only to the detriment of business users who are impacted by the pressure that the migration places on the legacy hardware. In addition, the migration hardware itself must be robust. SQL Servers and, specifically, the quality of the SQL Server storage subsystem IOPS, etc.) will have a significant impact on the ability of the migration solution to facilitate high transfer throughput.
Test achievable migration throughput
You'll want to gather empirical evidence of achievable throughput by testing your systems. Even then, migration duration predictions will fluctuate based on the average file sizes of already migrated content vs. the average file size of remaining content. In other words, if actual migration metrics are gathered using a small number of large files, inflated metrics may result in an artificially short migration duration. If the actual migration metrics are gathered using a large number of small files, deflated metrics may result in an artificially long migration duration.
Don't over plan!
A common cause of migration failure is never doing it! Some organizations continue planning because of a fear of terrible things happening during migration.
Keep the migration plan as simple as possible and the destination as simple as possible to avoid this
issue.
13

Maybe you can have a perfect journey
At the start of this paper, I talked about the three things everyone wants from a migration: speed, accuracy, and low cost. More importantly, I made the statement that you could only achieve two. The reality is that no one wants to give up data accuracy. So that means you can have it fast and accurate, but it won't be cheap. Or, you can go slow with cheap DIY efforts and maintain accuracy, but it will take a very long time. And note that it will likely end up costing more in the long run, thereby getting you only one out of the three goals.
To be successful with a migration to SharePoint, you need to follow the six steps and invest in a robust migration solution to help with analysis through to execution. And of course, I believe DryvIQ has that solution. We are constantly improving our platform to get the absolute most throughput and performance out of Microsoft 365 as Microsoft makes changes and improvements to available APIs. We pride ourselves on helping clients execute migrations that are high quality and fast. You may pay more for the tool upfront, but the results end up saving you more money over the project scope. With DryvIQ you're getting the data to make the right decisions about how to appropriately migrate content, reduce risk and save money, you're getting the capabilities to automate improvements and process changes during migration, and you're getting it done faster and more accurately which helps with user adoption and overall success.
So I guess I take back what I said in the intro. With DryvIQ, you can have it all. Speed, accuracy, and the lowest overall cost option for migration success.
But don't just take it from me, check out the fantastic stories on the following pages of organizations like yours who used DryvIQ to execute successful SharePoint migrations.
Start Here

6 Steps to Plan Your Route for SharePoint Migration

14

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

6 Steps to Plan Your Route for SharePoint Migration

15

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

6 Steps to Plan Your Route for SharePoint Migration

16

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

6 Steps to Plan Your Route for SharePoint Migration

17

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

6 Steps to Plan Your Route for SharePoint Migration

18

