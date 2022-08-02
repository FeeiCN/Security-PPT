© 2018 SPLUNK INC.
Solve Fundamental IT Issues by Leveraging Your Network Tools' Data Using Splunk
Christopher Jonnes | NetCentrics Jonathan Fair | DIOS Tech
October 4, 2018 | Orlando, FL

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Introduction
Solve Fundamental IT Issues by Leveraging Your Network Tools' Data Using Splunk

Christopher Jonnes - NetCentrics
 Started on Service Desk worked way up  10 Years + IT experience  2+ Years Splunk experience  Splunk Admin, Sec +, ITIL, MSTA
Avid fantasy baseball player

Jonathan Fair - DIOS Tech
 5 Years in the Marines, Incident Response, Security Engineering, Operational Engineering
 12+ Years IT experience,  4+ Years Splunk experience  Splunk Architect, CISSP, ITIL, CEH
Drives a Tesla and an avid Gamer

© 2018 SPLUNK INC.
Overview
Solve Fundamental IT Issues by Leveraging Your Network Tools' Data Using Splunk
 Problems of managing your IT infrastructure today · What if you could see a holistic and accurate view of the assets on your network?
 Solution: Asset Data Hub · Sample dashboards
 Process flow of how it was built · i.e. Splunk searches along with methodology

Fundamental Network Issues
So many tools, so little time
 Managing multiple Tools  Utilizing your Tools Efficiently and
Effectively  Tracking devices on your network  What coverage gaps do you have?  How do you determine what your
tools don't see?
How do you know what you don't know?

© 2018 SPLUNK INC.

Tool Coverage and Network Visibility
Tell me about my network, Bob

© 2018 SPLUNK INC.

SPScaeatMccnuMhanrinointnyangggiTtToTeooormoioonlellgCnCCoTtooovTvveoeerloraralagggeee

 Different tools see the world differently
 Agents vs Agentless
 Proper configuration can be difficult to determine

Other Challenges
Why can't this just be easier!
 Many moving parts  Inefficient Communication  Miscommunication  Causing wasted resources, wasted time and wasted money.  Problem exists EVERYWHERE!
So, how do we fix this??

© 2018 SPLUNK INC.

Don't Worry We Got You!

© 2018 SPLUNK INC.

Asset Data Hub

© 2018 SPLUNK INC.

Asset Data Hub
General Information

© 2018 SPLUNK INC.

Asset Data Hub
Lookup

© 2018 SPLUNK INC.

Asset Data Hub
Tool Dashboards ­ All Data is Correlated

© 2018 SPLUNK INC.

Asset Data Hub
Custom Reports / Dashboards

© 2018 SPLUNK INC.

Asset Data Hub
Subnet Analysis

© 2018 SPLUNK INC.

We can use Splunk for all of this?

© 2018 SPLUNK INC.

How Is This Done?
Steps to success
 Gather raw data from relevant sources (Get data into Splunk)
 Determine important and relevant fields and features that each tool can provide
 Correlate and normalize the data  Summarize the information for ease of
understanding and use  Create a endless and scalable solution
Let's look at an example!

© 2018 SPLUNK INC.

Gather Raw Data
Leverage any indexed data to populate our Dataset
 Get indexed data for each tool / data source in your environment · Patching, monitoring, security, management, scanning, discovery tools · Includes non-obvious sources such as DHCP and Windows Security Logs
We are going to use Splunk as our example to walk through

© 2018 SPLUNK INC.

Determine Relevant Information
Useful data != data
 How do you know what you don't know?  What was the initial question that lead to this solution?  Begin to understand what data is useful and relevant
Key to success is not overwhelming with pointless data

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Normalize and Baseline
Making all the data look the same
 Understanding the differences between each data source  Multiple data sources, formats, field names  Create a standard baseline for these "common" fields  Retain Latest information by chosen baseline unique field (e.g. hostname)

© 2018 SPLUNK INC.
Summarize and Prioritize
Tool Trustworthiness is Key
 Multiple large, scheduled searches merging the data together into the existing list  Keeping the information updated, relevant, and current  Automation of list maintenance ensures that once this is functional, it won't require outside
influence.  Prioritize authoritative field output by trustworthiness and accuracy of data source.

Summary

© 2018 SPLUNK INC.
1. Any data source can tell you a lot about
your network
2. Merging all sources together is a
solvable problem
3. Many different possibilities by merging
together different sources to tell a story · Patching · Users · Serial Numbers to specific locations · Software Purchased vs Installed vs Usage · So many possibilities, so little time...

© 2018 SPLUNK INC.
Questions?

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

