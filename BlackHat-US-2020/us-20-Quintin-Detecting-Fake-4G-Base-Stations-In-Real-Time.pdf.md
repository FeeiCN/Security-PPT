Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Detecting Fake 4G Base Stations in Real Time
Cooper Quintin - Senior Security Researcher - EFF Threat Lab Black Hat USA 2020

Intro
· Cooper Quintin
­ Senior security researcher ­ Has a toddler (dad jokes) ­ Former teenage phone phreak
· EFF
­ Member supported non profit ­ Defending civil liberties ­ 30 years
· Threat lab

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Yomna!
None of this research would have been possible without her hard work. This is as much her project as mine.
Twitter: @rival_elf

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Actual photo of Yomna

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Technology that Targets At Risk People
· Activists, human rights defenders, journalists, domestic abuse victims, immigrants, sex workers, minority groups, political dissidents, etc...
· Goals of this technology
­ Gather intelligence on opposition ­ Spy extraterritorially or illegally ­ Locate and capture ­ Extortion ­ Harass and intimidate ­ Stifle freedom of expression

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Jeff Bezos Can Afford a Security Team

Cybersecurity and AV companies care about the types of malware that affects their customers (usually enterprise.)
We get to care about the types of technology the infringe on civil liberties and human rights of at risk people.

This guy is not at risk.

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Our Goals
· Protect people · Broaden our communities` understanding of threats
and defenses · Expose bad actors · Make better laws

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Previous Project

Stalkerware

Dark Caracal

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What We are Going to Talk About Today
· Cell-site simulators AKA Stingrays or IMSI Catchers · How they work · Previous efforts to detect them · A new method to detect them · How to fix the problem

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Cell Technology Overview
· UE - The phone - User Equipment · IMSI - International Mobile Subscriber ID - ID for the
SIM card · IMEI - International Mobile Equipment ID - ID for the
hardware · eNodeB - Base station, what the UE is actually
communicating with. · EARFCN - The frequency a UE/EnodeB is transmitting on · Sector - A specific antenna on the base station

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Cell Technology Overview
· MIB - Master Information block, broadcast by the enodeb and tells where to find the SIB
· SIB - System information block, contains details about the enodeb
· MCC / MNC / TAC - Mobile Country Code, Mobile Network Code, Tracking Area Code
· PLMN = MCC + MNC, Public Land Mobile Network

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Cell Technology Overview
IMSI catcher, Stingray, Hailstorm, fake base station == cell-site simulator (CSS) This is acronym hell and I'm sorry.

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Cell Technology Overview

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What Changed between 2G and 4G
· eNodeB and UE mutually authenticate · Better encryption between eNodeB and UE · No longer naively connect to the strongest tower

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What Changed Between 2G and 4G
· eNodeB and UE mutually authenticate · Better encryption between eNodeB and UE · No longer naively connect to the strongest tower

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
How do 4G CSS Work
· What are the vulns next gen CSS are taking advantage of?
· Pre authentication handshake attacks
· Downgrade attacks
Gotta catch em all whitepaper by Yomna

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Pre-Authentication Vulnerabilities
· 4G has a glass jaw · Even though the UE authenticates the tower there are
still several messages that it sends, receives, and trusts before authentication happens or w/o authentication · This is the weak spot in which the vast majority of 4G attacks happen

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
InseHcuurse Connection Bootstrapping in Cellular Networks:The Root of All Evil -

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Here there be dragons
InseHcuurse Connection Bootstrapping in Cellular Networks:The Root of All Evil -

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
How Often are CSS Being Used
· ICE/DHS - hundreds of times per year
­ https://www.aclu.org/news/immigrants-rights/ice-records-confirm -that-immigration-enforcement-agencies-are-using-invasive-cell-p hone-surveillance-devices/
· Local law enforcement
­ Oakland - 1-3 times per year
· https://oaklandprivacy.org/oakland-privacy-sues-vallejo/
­ Santa Barbara PD - 231 times in 2017
· https://www.eff.org/deeplinks/2019/05/eff-asks-san-bernardino-court-rev iew-device-search-and-cell-site-simulator

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
How Often are CSS Being Used
· Foreign Spies
­ IMSI Catchers in DC
· Cyber Mercenaries
­ NSO Group https://www.amnestyusa.org/wp-content/uploads/2020/06/Moro cco-NSO-Group-report.pdf
· Criminals
­ https://venturebeat.com/2014/09/18/the-cell-tower-mystery-grip ping-america-has-now-been-solved-or-has-it/

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Previous Efforts to Detect CSS

App Based
· AIMSICD · Snoop Snitch · Darshark

Strengths · Cheap · Easy to use
Weaknesses · Limited data · Lots of false positives · False negatives?

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Previous Efforts to Detect CSS

Radio Based
· Seaglass · SITCH · Overwatch

Strengths
· Better data · Lower level information
Weaknesses
· Harder to set up, use, interpret
· Cost of hardware · Can't transmit

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Previous Efforts to Detect CSS

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Can we detect 4G IMSI Catchers?
· How can we improve on previous attempts
­ Lower level data ­ See all towers not just what we are connecting to ­ Compare that data over time ­ Look at 4G antennas! ­ Verify results!

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Introducing Crocodile Hunter

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Crocodile Hunter Software Stack
· Backend based on SRSLTE
­ Open source LTE software stack ­ Written in C++ ­ Communicates with frontend over a local socket
· Python for heuristics, database and frontend
­ Get data from socket ­ Add it to database ­ Run heuristics ­ Display tower locations
· API for sharing data

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Crocodile Hunter Hardware Stack
· Laptop / Raspberry Pi · USB GPS Dongle · SDR compatible with SRSLTE: BladeRF, Ettus B200 · LTE Antennas · (Battery for Pi)

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Crocodile Hunter Hardware Stack

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Workflow
1. Decode MIB and SIB1 for all the cells that we can see and record them.
2. Map the probable location of cells 3. Look for anomalies in the readings 4. Locate suspicious cells and confirm results

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Decode MIB and SIB1
· SRSLTE scans a list of EARFCNS · If we find a mib we decode mib and sib and send over socket

Database

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Mapping out antennas in real time
· Using trilateration and distance estimates we can figure out where all the towers are
· Compare this to a ground truth such as wigle or opencellid

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Trilateration vs Triangulation

Trilateration L = RRR

Triangulation (Bearing) L = BBB

x°

y°

d

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Looking for Anomalies
· Cells moving · Cells that change signal strength · Cells that aren't where they should be · Cells changing parameters · Cells missing parameters · New cells · Anomaly != CSS, that's why we have to verify

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Why Don't we Transmit?
EFF Lawyers

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What we Found so Far
Cell on wheels at Dreamforce

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What we Found so Far
Suspicious eNodeBs in Washingt·onStDouwCspeircsioinusDfCoreign

Washington DC

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Ongoing Tests
· Latin America (FADe Project) · DC · NYC · Your hometown (coming soon...)

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Future Work
· Better heuristics · Better location finding · Machine learning for detection of anomalies · Port to cheaper hardware

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
What's With the Name?
Press F to pay respects to Steve

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
How Can we Stop Cell-Site Simulators
· End 2G support on iOS and Android now!
­ https://www.eff.org/deeplinks/2020/06/your-phone-vulnerable-be cause-2g-it-doesnt-have-be
· Eliminate pre-authentication messages
­ TLS for the handshake with towers
· More incentives for standards orgs (3GPP), carriers, manufacturers, and OEMs to care about user privacy
· Nothing is foolproof but we aren't even doing the bare minimum yet.

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Key Takeaways
· We have a pretty good understanding the vulns in 4G which commercial cell-site simulators might exploit
· None of the previous IMSI catcher detector apps really do the job any more.
· We have come up with a method similar to established methods but targeting 4G.
· The worst problems of CSS abuse can be solved!

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Thanks to the following people
· Yomna! · The whole EFF crew · Andy and Bob at Wigle · Roger Piqueras-Jover · Nima Fatemi with Kandoo, Surya Mattu, Simon · Carlos and the FADE Project · Karl Kosher, Peter Ney, and others at UW (SEAGLASS) · Ash wilson (SITCH) and Eric Escobar (Defcon Justice
Beaver) · Kristin Paget

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
Thank you!
Cooper Quintin Senior Security Researcher
EFF Threat Lab cooperq@eff.org - twitter: @cooperq https://github.com/efforg/crocodilehunter

Bl<acLkohcaat<tUlioSncAa, /td/iaoAtuneg,>d20a2t0e>
References
1. https://www.eff.org/wp/gotta-catch-em-all-understanding-ho w-imsi-catchers-exploit-cell-networks
2. https://github.com/srsLTE/srsLTE 3. https://arxiv.org/pdf/1710.08932.pdf 4. https://www.usenix.org/system/files/conference/woot17/woo
t17-paper-park.pdf 5. https://seaglass-web.s3.amazonaws.com/SeaGlass___PETS_20
17.pdf 6. https://www.sba-research.org/wp-content/uploads/publicatio
ns/DabrowskiEtAl-IMSI-Catcher-Catcher-ACSAC2014.pdf

