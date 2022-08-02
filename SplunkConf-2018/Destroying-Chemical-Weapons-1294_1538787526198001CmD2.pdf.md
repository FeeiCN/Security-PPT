© 2018 SPLUNK INC.
Destroying Chemical Weapons with Splunk
Integration of the Industrial Internet to Optimize Plant Performance

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Session Presenters

© 2018 SPLUNK INC.

v
KATIE MARTIN
Production Control Analyst

ANDY SHAFFER
Pilot Test Coordinator

Chemical Demilitarization

History of U.S. chemical weapons disposal

 United States must safely manage and destroy legacy chemical weapon stockpiles
· Chemical Weapons Convention (as of 1997)
 The Program Executive Office, Assembled Chemical Weapons Alternatives (PEO-ACWA) is responsible for the safe and environmentally sound destruction of the remaining U.S. chemical weapons stockpile
Historical disposal methods leave
something to be desired...

PEO ACWA

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
U.S. Chemical Demilitarization Facilities

Umatilla, Oregon 100% Complete
· 12.2% (3,374 MT)
 · GB, VX, HD
· Ton Containers · Munitions
Tooele, Utah 100% Complete
· 43.6% (12,121 MT) · GA, GB, VX, HD, HT, H, L
 · Ton Containers
· Munitions
Johnston Atoll 100% Complete
· 2.3% (640 MT) · GB, VX, HD
 · Ton Containers
· Munitions

Pueblo, Colorado 11.0P4ue%bCloo,mCOplete
· 8.5% (2,371 MT) · HD, HT · Munitions
Hawaii

NeNwepworpto, rInt,dIiNana 110000%% Commpplleettee
 · 4.1% (1,152 MT)
· VX · Ton Containers

VarioNusewNpoonr-tS,tIoNckpile 10D0e%stCruocmtpiolente

· 1.7% (466 MT)



AbeArbdeeredne,eMn,aMryDland 100% Complete
· 5.3% (1,471 MT)
 · HD
· Ton Containers

Pine Bluff, Arkansas 10P0in%e BCloumff,pAleRte
· 13.2% (3,493 MT) · GB, VX, HD, HT, DF, QL
 · Drums and Canisters
· Ton Containers · Munitions

Richmond, Kentucky 0B.l1u%e GCroamssp,leKtYe
· 1.7% (475 MT) · GB, VX, H · Munitions

AnnAisntnoinst,oAnla, bAaLma 100% Complete

· 7.4% (2,045 MT)

· GB, VX, HD, HT · Ton Containers · Munitions



Operations Complete

Facility in Systemization Phase

MT = Metric Tons As of July 27, 2018

© 2018 SPLUNK INC.
Pueblo Chemical Agent-Destruction Pilot Plant
 PEO ACWA, headquartered at Aberdeen Proving Ground, Maryland, is responsible for managing all aspects of the safe and environmentally sound destruction of the chemical weapons stockpiles in Colorado and Kentucky.
 The Pueblo Chemical Agent-Destruction Pilot Plant (PCAPP) will safely destroy 2,613 tons of mustard agent in mortar rounds and artillery projectiles stored at the U.S. Army Pueblo Chemical Depot (PCD).
· Neutralization followed by biotreatment is the technology selected by the Department of Defense to
destroy the Pueblo chemical weapons stockpile.
 The Bechtel Pueblo Team (BPT) is a partnership of Bechtel National, Inc., AECOM, and Battelle Memorial Institute. The BPT functions as the systems contractor selected to design, build, systemize, pilot test, operate, and close the PCAPP.

Chemical Demilitarization
Modern method for destruction of chemical weapons

© 2018 SPLUNK INC.

Removal of energetics

Removal of mustard agent

Neutralization of mustard agent

Biotreatment

Thermal treatment and disposal of metal parts

Early Splunk Implementation at PCAPP

© 2018 SPLUNK INC.

 At the start of munition destruction operations, process data was available, but with limited capacity and access · Only two workstations with the ability to pull data · Air-gapped control and access systems made engineers and analysts develop charts in a
control system software, paste screenshots into Word, print, and then scan the paper copy
 Splunk initiative was going on in the background · Two people used a small Splunk deployment daily · Five people had access to the Splunk instance

Manual Data Collection

© 2018 SPLUNK INC.

 Splunk was proposed as a data collection and management system
 Many challenges to overcome · Facility Control System (FCS) security constraints require it to be stand-alone; a highly
manual process was used to get usable information into Splunk
· Started indexing 700 instruments at 1­2 GB per day
 Evaluation of historical process system upsets provided an opportunity for PCAPP's Splunk lead to show what data can do · Spill events in the water recycling system were analyzed in approximately 4 hours rather
than the usual months (3­4)

© 2018 SPLUNK INC.
Retrospective Analysis of Pressure Relief Valve Release

19:52
7:52 PM Increase in distillate conductivity 20:00
8:00 PM

20:34
8:34 PM Operators Manually reset the
pressure safety valve

18:54

Pressure valve release

6:54 PM

Distillate condensation spike

6:00 PM

7:00 PM

8:00 PM

9:00 PM

19:54

7:54 PM

Loss of cooling water

20:04

8:04 PM

Cooling water pumps

Back in operation

10:00 PM

11:00 PM

12:00 AM

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Timeline When Viewed With Splunk and ICS Data 7/16/2017 8:00 PM Pressure valve release

7/1 Begin filling feed tank B
6/26 High chemical oxygen
demand upstream
6/21 Begin filling feed tank C

7/16/2017
7:52 PM Increase in distillate conductivity

7/16/2017

7/16/2017
8:34 PM

6:54 PM

Operators Manually reset the

7/13

Distillate condensation spike pressure safety valve

Begin feeding from tank C

7/16/2017

6:45 PM

Positive pressure in condenser

6/21
LEGEND
 Pre-Splunk analysis  Splunk discoveries

7/23
7/16/2017 7:54 PM Loss of cooling water 7/16/2017
8:04 PM Cooling water pumps
Back in operation

Retrospective Analysis Summary

© 2018 SPLUNK INC.

 Quickly identified buried causes of a pressure safety valve release
 Set up alerts for predictive maintenance · When to expect high protein levels that will lead to foaming in the equipment · Install alarm indicating negative-to-positive pressure in the evaporator
 Forewarned operators of conditions that lead to foaming which allows for early mitigation · System operation now includes proactive addition anti-foaming agent

© 2018 SPLUNK INC.
Proof of Concept Spurs Long-Term Strategy
 Transitioned from manual data loading to live data feed using a unidirectional security gateway (data diode) · Indexing 9,000 instruments at 7 GB per day
 Developed a team to build the new deployment · Information Systems and Technology architects · Data scientists · Engineers · Operations staff

© 2018 SPLUNK INC.
Splunk is Integrated in Daily Decision Making
 Splunk dashboards are discussed at daily status meetings
 400% increase in the number of daily users · Analytics team · Management · Engineering · Operations

Big data initiative maturity
With great data comes great responsibility
 Accessible by the entire facility

© 2018 SPLUNK INC.

 First goal is to provided simple trends to gain buy-in from daily users

 Analytics team continues to mature and has started to use the machine learning toolkit

© 2018 SPLUNK INC.
Application of the Machine Learning Toolkit at PCAPP
Evaluation of low-temperature alarms in the Off Gas Treatment System

B20TIC2483 ­ low temperature event

 Drop in temperature in the plant's Off Gas Treatment System triggered plant alarms
· Management placed a
hold on upstream system operations until the event was understood ­ processing stopped
 Complicated interactions make manual trend analysis difficult; too many variables to manually track interactions

© 2018 SPLUNK INC.
Manual Data Evaluation Feeds Machine Learning
 Off Gas Treatment System temperature is influenced by multiple system operations
· Activity of a supposedly isolated system may be influencing temperature drop, but this doesn't fully
behavior
· Plant activities (waste treatment operations, munitions processing, chemical agent levels, etc.)
overlap, making concise analysis impossible
 Leverage Splunk Machine Learning Toolkit (MLTK) to tease out relationships/impacts
 Multi-step process to troubleshoot system interactions, rather than strict machine learning approach
· Build a first-pass model using a static dataset (includes data from before, after, and during the low-
temp event)
· Perform equipment maintenance, perform post-maintenance testing, and then apply model to
operational and system test data (after event and testing period)
· Model system using a post-maintenance data set and compare to previous model outputs

© 2018 SPLUNK INC.
Application of the Machine Learning Toolkit at PCAPP
Evaluation of temperature in the Off Gas Treatment System using a static dataset

© 2018 SPLUNK INC.
Equipment Evaluations and Maintenance Evolutions
 First-pass model suggests an "isolated" stream (B24FV9410A__PV) is impacting temperature
 System valves manually checked twice (between event and later testing) · Anecdotal report of ¼ to ½ turn on that valve before it reached a fully closed position · Leak-by past this valve may have been impacting downstream temperatures
 Heater system adjustments made based on model significance · Inlet flows (B03FIC9308A/B) adjusted · Average air temperature decreased by 100°F · Systems that showed difference in performance began to respond similarly

© 2018 SPLUNK INC.
Low Temperature Event Model Application - Testing

© 2018 SPLUNK INC.
Data Evaluation Conclusions and Recommendations
 Findings from this Analysis · A model fit using pre-maintenance data does not accurately predict
post-maintenance performance
· Maintenance matters! · Building MLTK models helps understand the system
· Increased R2 and RMSE (0.7791/4.32) ­ more predictable performance · B24FV9410A__PV shows changed relationship (negative to positive)
 Conclusions · Maintenance matters! Temperature is no longer shifted by the activity of a single system · Resumption of system operations following Splunk team analysis and recommendation · More work needed to better predict performance, lots of model training and testing
 MLTK can be used to quickly evaluate plant performance and system interactions · More research and staff learning needed to develop truly predictive models
 PCAPP is just beginning to see how Splunk and the MLTK can help the project understand the process, find new efficiencies, and make chemical weapons destruction even more safe!

© 2018 SPLUNK INC.

Key Takeaways

1. Increased access to data drives
informed decision making
2. Innovation requires collaboration
3. Machine learning tool kit is used to
predict and analyze live data

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

