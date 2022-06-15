Tester: One Step Forward Jacky Guo

About this presentation
 Overview
 Testing vs. Quality Engineering  Start preventing bugs

Objectives
 After this presentation, you'll be able to:
 Identify a phased approach for preventing bugs
 Identify two actions for tomorrow to prevent bugs

Test vs. Quality Engineering (SQE)
"Test: to try something out... in order to find out... how well it works..."
"Engineering: the application of science in the design planning, construction and maintenance of... manufactured things"

Test vs. Quality Engineering (SQE)
(continued)

Test
 Late in the timeline  Reactive  Find defects  Singular in affect

Quality Engineering
 First in the timeline  Proactive and reactive  Understand defects  Multiplicative in affect

Phase 1: how do I start?
 Written requirements
 Clarify user& user scenario  Have your design principle
· Simple
 One Step instead of two or three  Avoid repeated things  Batch command
 Bug the documents
 "Does everyone see the same picture?"  "Will" versus "might, should, desirable"
 Testability/ Sustainability
 SMART

Case Studies
 Weibo
 360
 Douban
 Alipay  Dianping  Online Game

Phase 1: how do I start? (continued)
"Look" at Dev Design
 Understand dev design
 Work flow  Data flow  Data Structure
 Cover different user scenario  Testability  Risk

Phase 1: how do I start? (continued)
"Look" at code
 API & Parameters  Code inspections or reviews
 Reviews are light-weight  Target code subsets  Inspect only the most critical/difficult sections
 Debugging skill

Phase 1: done
Congratulations
 You have just grabbed low-hanging fruit  You have prevented countless bugs  You have risen above at least 50% of the Industry
Now what?

Phase 2: change the process
Learn about your bugs  Find the cause
 Unexpected customer requirement?  Vague spec?  Rushed design?  Domain knowledge?  Code error?
 Be gentle, accurate and honest
 Make a change  Bug "Social Network" & Data mining

Call to action
 Start small, get a win
 What are people most upset about?  What is the low-hanging fruit?  What does the RCA data say?
 Be prepared to set the example

Call to action (continued)
What can you do tomorrow (pick 1)?
 Document one requirement  Document one design  Code-review one critical section  RCA 10 bugs  Implement 10 unit tests

Test case Management
· TC from Bugs by customer/external users · TC from review dev design · TC from user scenario · TC from Bugs review in case of regression · Regression Test strategy("diff" VS "full") · BVT runs before Dev Check in

Bug Management
· Map to TC · Bug quality · Root cause(process may needs change) · Bug fix review to evaluate the risk · Control the bar to fix bug(potential risk)

