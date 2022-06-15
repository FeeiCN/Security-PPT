Using Domain Name Registrant Information To Identify Malicious Domains
Mark Langston
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Do Bad Actors Use Fake Addresses?
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Copyright 2015 Carnegie Mellon University

This material is based upon work funded and supported by the Department of Defense under Contract No. FA8721-05-C-0003 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.

NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.

[Distribution Statement A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.

This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.

CERT® is a registered mark of Carnegie Mellon University.

DM-0003089

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

3

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Secrecy, and Finding What's Hidden
"Secrecy is a way of organizing institutions and human activity to render them invisible."
"Secrecy is self-contradictory; because what is made secret exists in the world, it is visible."
Trevor Paglen, artist ("Six Landscapes". Chaos Communication Congress, 2013)

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

4

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

The Problem With WHOIS Data
· Not all in one place.
· Whois API, LLC · Not all ccTLDs · Not all TLDs (e.g.,
.edu, .mil) · 162 million records · 2015, Q2 · 238GB

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

5

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

What Constitutes a Bad Actor?
· Phishing domain blacklist
· June 2015 · Hosts-file.net
(Malwarebytes) · 734,428 unique
fully-qualified domain names · 103,658 unique domains

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

6

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

The Address That Started It All

Gazetny Lane Bldg. 1 17 9 125009 Moscu Rusia 125009 RUSSIAN FEDERATION petrdeitalia@post.cz Petr Abandonato

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

7

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

The Address That Stoked The Flames

Ilyinka Street 23, Moscow 103132, RUSSIAN FEDERATION the.malware.cabal@gmail.com, Spy Eye

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

8

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Diving in!

· Hadoop, Spark (PySpark)
· Only 58% of phishing domains found in WHOIS data
· Half of the remaining are in TLDs for which there was no data
· Three most frequent: .tk (4,612), .ru (4,384), .co.uk (2,716)
· Leaving 20,309 that just weren't found.

Using Domain Name Registrant Information

November 24, 2015

© 2015 Carnegie Mellon University

9

Distribution Statement A: Approved for Public Release; Distribution is Unlimited

Diving in! Registrars!
· GoDaddy the most frequent registrar (23.9%)
· eNom (13.4%) · Network Solutions (5.3%) · Publicdomainregistry.com,
name.com, Tucows, Soluciones Corporativas IP (12.1%)

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

10

Then...

...things started to go wrong.

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

11

Privacy Services

· 17,551 domains used some form of privacy protection.
· Another 2,960 had no registrant information.
· Rendering opaque 34% of the domains for which we have data.

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

12

Repossession

· 625 domains (mostly GoDaddy) were listed as "Repossessed".
· Another 217 (all eNom) were in a "reactivation period".

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

13

Repossession (cont.)

· 395 domains registered to gbclaw.net.
· Another 963 registered to MarkMonitor
· 52 registered to Stephen Gaffigan
· 34 to CitizenHawk

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

14

Resellers

· 181 registered to Frank Schilling/Name Administration Inc BVI.
· 408 to New Ventures Services Corp.

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

15

Rogue Registrars

· 204 only info is BIZCN.COM, INC
· Linked to illegal internet pharmacies (Huffington Post, 11/7/14; Wall Street Journal, October 27, 2014)
· Found in breach of ICANN accreditation agreement May 8, 2014

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

16

Rypo...er, Typosquatters

· 415 registered to Nadeem Qadir (e.g., travelasity.com)
· 325 Bladimir Boyiko (e.g., wwwpbs.org)
· Both use 2006.nip.net email address

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

17

Other Suspicious Activity

· 220 registered to GDS Licensing
· Associated with illegal import of fake cancer drug Avastin in 2013
· Several domains checked with legitscript.com listed as "rogue" pharmacies.

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

18

More Suspicious Activity

· Harjanti Chandra
· 1,321 unique domains
· All in the .info gTLD
· Appear related to popular mobile app downloads
· Websites hosted in Hanoi, Vietnam
· Registrant in Indonesia

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

19

Conclusions

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

20

Conclusions
· Registrant information mining is difficult ­ no standards for field entries, even within an entity
· WHOIS Privacy services present a barrier to analysis · There are entities whose names may be worthy of a priori filtering
­ but identifying those entities is time-consuming, often subjective, and largely manual · The legal aspect of domain name ownership does not always keep pace with usage ­ malicious activity may extend beyond ownership changes, or begin before legal proceedings can start · Fake address "watering holes" do not seem to be prevalent, or even common.

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

21

Contact Information
Presenter / Point of Contact Mark Langston Member of Technical Staff Telephone: +1 412.268.1942 Email: mclangston@sei.cmu.edu

Using Domain Name Registrant Information November 24, 2015
© 2015 Carnegie Mellon University
Distribution Statement A: Approved for Public Release; Distribution is Unlimited

22

