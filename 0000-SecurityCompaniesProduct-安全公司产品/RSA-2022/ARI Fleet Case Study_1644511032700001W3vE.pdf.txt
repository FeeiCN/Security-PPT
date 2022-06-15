Customized Data Masking for ARI Fleet

CASE STUDY

A Growing Threat
Companies worldwide are collecting data at exponential rates through the many ways organizations are applying data insights in improving areas of their businesses. However, mainly due to public concern, governments are stepping in with strict regulations on how these organizations store and safeguard the privacy of personal data. In turn, the same companies are reassessing how they define, locate, and protect sensitive information, while still utilizing the data for internal business analysis.
PKWARE provides powerful software solutions for businesses of all sizes and types, to accurately define, locate, protect, and monitor sensitive data stored across their organization. Developed with the user in mind, PKWARE software is simple to install and implement. Many organizations are running at full capacity in a matter of days, using just the default configurations. However, some clients have unique environments, requiring custom configurations. Fortunately, PKWARE is flexible enough to accommodate account-based customizations without the timeconsuming dependency of waiting for product development to add the solution to the core product. An example of PKWARE developing a custom configuration to support a client's unique environment features the globally operated fleet management company, ARI Fleet.
The Challenge
ARI has amassed a tremendous amount of valuable data over the years, spanning three (3) large Oracle databases. Among the data is information ARI deemed to be sensitive and wanted to protect through data masking techniques. However, ARI wished to mask the sensitive data in specific ways, which were not standard features built into products on the market. Of the solutions ARI reviewed that were capable of accommodating

Company Profile
ARI delivers global fleet management services and solutions that empower organizations to translate their fleets' data into decreased asset and operating costs, improved driver safety, and better results for their end clients. Found in 1948 by Holman Enterprises, today ARI manages more than 1.7 million vehicles in North America, the UK, and Europe and, together with its strategic partners, 3 million vehicles worldwide
ARI embraces the concept that happy employees make for happy customers and places a strong emphasis on their family culture, employee engagement, education, training and development.
More information about the values and history of ARI can be read online at
www.arifleet.com

their customization, they were not satisfied by the long implementation times, lack of flexibility, and high costs of those options.
The specifications around their data masking request created a challenge for ARI. They needed to find a solution able to support custom data masking and capable of consistent synchronization across three (3) separate application databases. Fortunately for ARI, PKWARE is powerful enough to scan large databases without requiring massive investments in computing power and flexible enough to handle various data types and formats while applying customized data masking per unique requirements. Below are examples of the masking specifications ARI was looking for:
Data Masking Specifications
 Mask all characters but keep the length of the original entry.
 Keep some original character values based on specific criteria while scrambling remaining characters
 Partial masks with the inclusion of special values
 Parsing across multi-field values, replacing all values using a built-in PKWARE function while excluding certain characters from masking
 Retaining portions of fields while masking other values
 Keeping original field formatting, masking portions based on business criteria
The Solution
Approach
Data Discovery During ARI's proof of concept (POC), PKWARE ran data discovery tasks across ARI's databases to ensure the tool was capable of identifying the sensitive data to mask. Data discovery identified over 2,000 columns within each database, for a total of 8,000+ columns across all three (3), that would potentially require data masking.
Data Discovery
Once data discovery was complete, the next step was to review the tool's findings from a business

context and further refine the list of fields to those that required masking according to ARI's masking standards. The tool was then configured to mask the existing data within ARI's databases. This process was completed over an agreed-upon timeline of two (2) months. Upon completion, the masking implementation was tested and verified by the ARI team to ensure execution met their functional requirements and operational time windows. For the next, and final step, PKWARE helped automate the process by constructing scripts, which the ARI team then used to integrate the custom masking tasks into their normal operations as new data gets added to their databases.
Implementation
For Custom Functions
PKWARE Professional Services team built custom functions in Oracle PL/SQL, conforming to PKWARE standards for solving custom masking use cases. The custom masking provides ARI with the ability to accomplish masking without negatively impacting the efficiency of existing development and testing activities. The speed of customization allowed ARI to maintain forward progress towards its masking goals in a very aggressive timeframe.
For Building Tasks
PKWARE Professional Services team built a custom Python script, which reads an ARI-prepared file containing details of the data columns requiring masking, such as data type, length and sensitivity classifi-cation, then generates JSON task definitions. The custom script then picks up the JSON outputs file and creates tasks from them via DGCL using a custom command.
For Automated Execution
PKWARE Professional Services team also assisted ARI with scripts for a fully automated, hands-off solution. Below are some of the automated solutions provided:
 Custom Invocation: Configurable listing to invoke DgSecure for tasks associated with JSONs and names/IDs
 Automatic Execution: Tasks start sequentially from the given listing
 Automatic Polling: PKWARE polling to check the status of running tasks(s)
 Graceful failure handling: Automatically fetch

logs, read target DG tables, compile, and notify via email alert  Notifications: Email notification with detailed results of execution and log file
Business Benefits and Results
PKWARE's solution provided tremendous value to the ARI team, especially when contrasting them against building an in-house solution and other available options on the market.
PKWARE provided more sophisticated functionality, monitoring, and consistency across systems in less time when compared to in-house development options. In turn, going with PKWARE also allowed ARI to avoid diverting precious development resources from client-facing project work.
Compared to other solutions on the market, PKWARE's implementation time, flexibility, and cost helped ARI conclude their decision. Here is more specific detail on each of these areas:
Implementation Time
PKWARE handled the initial product implementation time in a couple of months. The tool required minimal training and infrastructure resources. Combined with its runtime efficiency, this product imple-mentation was a quick success in ARI's environment.
Flexibility
PKWARE easily supported customizations and works across disparate databases. While the

project was initially envisioned to scan and run masking tasks on three (3) databases separately, PKWARE's in-house custom solutions surpassed expectations by providing ARI with an automated solution, which is now fully integrated into their operational workflow.
Cost
Compared to ARI's other options, in-house development or competing vendors, PKWARE provided the best economic choice. PKWARE's cost value allowed ARI to focus on its core business without massive invest-ments in time and resources, while still accomplishing the critical objectives of protecting sensitive data.
In addition to implementation time, flexibility and cost, team members, including DBAs, development and operations team members, can leverage the PKWARE-ARI Fleet implementation as it continues to develop its applications, enabling them to efficiently utilize the data while ensuring proper data privacy measurements are in place. PKWARE's cost value allowed ARI to focus on its core business without massive investments in time and resources while still accomplishing the critical objectives of protecting sensitive data.

 03/16/21

www.PKWARE.com | 201 E. Pittsburgh Ave. | Suite 400 | Milwaukee, WI | 866-583-1795

