Experiences and Lessons Learned from a Siemens-Wide Security Patch Management Service for Products

29th Annual FIRST Conference, June 11 - 16, 2017 Manuel Ifland, CISSP

© 2017 Siemens AG & SAFECode

siemens.com | safecode.org

After This Presentation You Will Know ...

· ... How a Siemens-wide service helps to keep products more secure.
· ... That using OSS and COTS components is not a piece of cake.
· ... What we should and can do to cope with the challenges.

© 2017 Siemens AG & SAFECode

Page 2

June 2017

Why Are We Using OSS and COTS Components?
Pre-made building blocks

© 2017 Siemens AG & SAFECode

Page 3

June 2017

Faster time-to-market Lower development costs

Where There is Light, There is Shadow.
· Products inherit security issues:

· Vulnerability information is spread all over the Internet · Patching is not always an easy task

© 2017 Siemens AG & SAFECode

Page 4

June 2017

The Siemens-wide
Security Vulnerability Monitoring (SVM) Service.

© 2017 Siemens AG & SAFECode

Page 5

June 2017

Siemens Security Vulnerability Monitoring (SVM)

Product / Solution Owner

Email

© 2017 Siemens AG & SAFECode

Page 6

June 2017

Components List
Workflow System

PDF RSS HTML

Scanning

XLS

Email XML

Manual Evaluation

Key Advantages of SVM For Siemens
Confidential information stays in Siemens

© 2017 Siemens AG & SAFECode

Page 7

June 2017

Neatly integrates into company's infrastructure (e.g. SSO, email encryption)

Key Advantages of SVM For Siemens (Cont.)

A

B

C

Dependencies

© 2017 Siemens AG & SAFECode

Page 8

June 2017

Security information from sources where support contract is required

Challenges

© 2017 Siemens AG & SAFECode

Page 9

June 2017

Challenges

Bill of Materials

Risk Estimation

Names of Third-party Components

© 2017 Siemens AG & SAFECode

Page 10

June 2017

Best Practices from SAFECode Third-party Components Working Group
· Special Interest Group for Third-party Components (TPCs) · Open Source (OSS) & Commercial off-the-shelf (COTS) · Various member companies on board:
· Adobe · Boeing · Intel · Microsoft · Siemens · Symantec

© 2017 Siemens AG & SAFECode

Page 11

June 2017

The Bill of Materials (BOM)
· First and foremost step! · It depends on where you are in the food chain:

BOM / List

New Code
Existing Code

© 2017 Siemens AG & SAFECode

Page 12

June 2017

Planned TPCs
Used TPCs
Planned TPCs

Naming of Third-party Components
· BOM TPCs need to be clearly and uniquely identifiable · Compatibility with external databases is the key!

© 2017 Siemens AG & SAFECode

Page 13

June 2017

Website

...

CPE

Source Hashes

Internal ID

Maven groupId, artifactId, version

Short Name

Human Readable
Name

Which TPCs Should We Use?
· TPCs are often chosen purely based on functionality
· The following should be considered however: · Component Maintenance · Development Practices · Security Vulnerabilities · End of Life

© 2017 Siemens AG & SAFECode

Page 14

June 2017

TPC Management Life Cycle ­ High Level Steps

© 2017 Siemens AG & SAFECode

Page 15

June 2017

Monitor

SDLC and TPC Management Life Cycle Go Hand in Hand

Requirements

Design

Develop

Support

...

Verify BOM

Maintain a List of TPCs

Assess Security Risks from TPCs

Mitigate or Accept Security Risks from Selected TPCs

Monitor for Changes in Risk Profiles of TPCs

© 2017 Siemens AG & SAFECode

Page 16

June 2017

Key Takeaways: Towards Supply Chain Security
OSS and COTS components can increase security risks

Monitor

Establish a process and perform constant monitoring

© 2017 Siemens AG & SAFECode

Page 17

June 2017

Identify components and maintain a BOM

Want to Know More?

© 2017 Siemens AG & SAFECode

Page 18

June 2017

http://safecode.org/ http://bit.ly/2qNSdej

Contact

© 2017 Siemens AG & SAFECode

Page 19

June 2017

Manuel Ifland, CISSP Siemens AG Otto-Hahn-Ring 6 Munich, Germany manuel.ifland@siemens.com
SAFECode Software Assurance Forum for Excellence in Code 401 Edgewater Place, Suite 600 Wakefield, MA 01880 https://safecode.org/ info@safecode.org

