SESSION ID: MBS-W01
Characterizing Malicious Traffic on Cellular Networks
A Retrospective

Chaz Lever
Researcher Damballa, Inc @chazlever

#RSAC

#RSAC
Mobile Malware

#RSAC
Malware Going Nuclear

#RSAC
Mobile Malware Research
 Significant effort has been spent by researchers to characterize mobile applications and markets.
 Market operators have invested significant resources in preventing malicious applications from being installed.
 Extent to which mobile ecosystem is actually infected is still not well understood.
Use network level analysis to better understand the threat.

#RSAC
Data Collection

2

Passive DNS Data Collection

3

1

4

Host

8 RDNS

= Collection Point

5 6 7

. (root)
com. (TLD)
example.com. (AuthNS)

Cell Wired

 Use passive DNS (pDNS) data collected at the recursive DNS (RDNS) level.  Data collected from a major US cellular provider and a large traditional, non-cellular ISP.

#RSAC
Characterizing Cellular Traffic

Classification of RR

Malicious Unknown

Benign

Labeling of Devices

NonMobile
Mix

Mobile

Cellular pDNS Data Summary

Week (2012)
4/15 - 4/21 5/13 ­ 5/19 6/17 ­ 6/23
Total (Unique)

Hours
168 168 168 504

RRs
8,553,155 9,240,372 8,660,555 16,298,114

Week (2014)
11/01 ­ 11/07 11/08 ­ 11/14 11/15 ­ 11/21 11/22 ­ 11/28 11/29 ­ 11/30
Total (Unique)

Hours
168 168 168 168 48 720

RRs
178,752,268 185,125,832 188,458,108 183,678,777 60,706,045 684,641,271

Domains
8,040,141 8,711,704 8,109,536 14,828,149
Domains
158,214,788 163,740,910 166,929,111 162,213,521 53,244,354 613,350,819

#RSAC

Hosts
2,070,189 2,168,266 2,050,168 3,053,704
Hosts
18,673,671 21,179,148 18,617,397 8,963,386 5,768,628 28,799,008

Devices (Avg)
22,469,561 24,223,108 21,932,245 22,874,971
Devices (Avg)
132,152,348 152,832,654 159,200,303 160,788,608 137,285,304 151,858,362

Cellular pDNS Data Summary

Week (2012)
4/15 - 4/21 5/13 ­ 5/19 6/17 ­ 6/23
Total (Unique)

Hours
168 168 168 504

RRs
8,553,155 9,240,372 8,660,555 16,298,114

Week (2014)
11/01 ­ 11/07 11/08 ­ 11/14 11/15 ­ 11/21 11/22 ­ 11/28 11/29 ­ 11/30
Total (Unique)

Hours
168 168 168 168 48 720

RRs
178,752,268 185,125,832 188,458,108 183,678,777 60,706,045 684,641,271

Domains
8,040,141 8,711,704 8,109,536 14,828,149
Domains
158,214,788 163,740,910 166,929,111 162,213,521 53,244,354 613,350,819

#RSAC

Hosts
2,070,189 2,168,266 2,050,168 3,053,704
Hosts
18,673,671 21,179,148 18,617,397 8,963,386 5,768,628 28,799,008

Devices (Avg)
22,469,561 24,223,108 21,932,245 22,874,971
Devices (Avg)
132,152,348 152,832,654 159,200,303 160,788,608 137,285,304 151,858,362

#RSAC
Hosting Infrastructure

Wired Hosts

Mobile Hosts

1.3%

· Observed 2,762,453 unique hosts contacted by mobile devices. · Only 1.3% (35,522) of "mobile" hosts were not in the set of hosts
contained by historical non-cellular pDNS data.
The mobile Internet is really just the Internet.

#RSAC
Evidence of Malware
 Public Blacklist (PBL)  Phishing and Drive-by-Downloads (URL)  Desktop Malware Association (MAL)  Mobile Blacklist (MBL)

#RSAC
Observed Historical Evidence

Volume of Requests (Log Scaled)

1.00E+11 1.00E+10 1.00E+09 1.00E+08 1.00E+07 1.00E+06 1.00E+05 1.00E+04 1.00E+03 1.00E+02 1.00E+01 1.00E+00

04/15-04/21

05/13-05/19

06/17-06/23

MBL PBL URL MD5 TOTAL

Mobile Specific Evidence

#RSAC
Observed Historical Evidence

Volume of Requests (Log Scaled)

1.00E+11 1.00E+10 1.00E+09 1.00E+08 1.00E+07 1.00E+06 1.00E+05 1.00E+04 1.00E+03 1.00E+02 1.00E+01 1.00E+00

04/15-04/21

05/13-05/19

06/17-06/23

MBL PBL URL MD5 TOTAL

Desktop Related Evidence

Volume of Requests (Log Scaled)

Observed Historical Evidence (Redux)
1.00E+11 1.00E+10 1.00E+09 1.00E+08 1.00E+07 1.00E+06 1.00E+05 1.00E+04 1.00E+03 1.00E+02 1.00E+01 1.00E+00
Mobile Specific Evidence

#RSAC
MBL PBL URL MD5 TOTAL

Volume of Requests (Log Scaled)

Observed Historical Evidence (Redux)
1.00E+11 1.00E+10 1.00E+09 1.00E+08 1.00E+07 1.00E+06 1.00E+05 1.00E+04 1.00E+03 1.00E+02 1.00E+01 1.00E+00
Desktop Related Evidence

#RSAC
MBL PBL URL MD5 TOTAL

#RSAC
Tainted Hosts and Platforms

Platform iOS All other mobile (Android, etc.)

% Population requesting % Population requesting

tainted hosts (2012)

tainted hosts (2014)

#RSAC
Tainted Hosts and Platforms

Platform iOS All other mobile (Android, etc.)

% Population requesting % Population requesting

tainted hosts (2012)

tainted hosts (2014)

31.6% 68.4%

#RSAC
Tainted Hosts and Platforms

Platform iOS All other mobile (Android, etc.)

% Population requesting % Population requesting

tainted hosts (2012)

tainted hosts (2014)

31.6%

38.9%

68.4%

61.1%

#RSAC
Tainted Hosts and Platforms

Platform iOS All other mobile (Android, etc.)

% Population requesting % Population requesting

tainted hosts (2012)

tainted hosts (2014)

31.6%

38.9%

68.4%

61.1%

#RSAC
Mobile Malware in Numbers
 Only 0.015% (3,492) out of a total of 23M mobile devices contacted MBL domains (observation period 2012).
 Only 0.0064% (9,688) out of a total of 151M mobile devices contacted MBL domains (observation period 2014).
 According to National Weather Service, odds of an individual being struck by lightning in a lifetime is 0.01% (1/10,000)!
Mobile malware is currently a real but small threat.

#RSAC
Market and Malware (M&A) Dataset

Market Name Google Play* SoftAndroid ProAndroid Anzhi Ndoo

Market Country US RU CN CN CN

Date of Snapshot 09/20/11, 01/20/12 02/07/12 02/02/12, 03/11/12 01/31/12 10/25/12, 02/03/12, 03/06/12

# Unique Apps 26,332 3,626 2,407 28,760 7,914

Malware Dataset Name Contagio
Zhou et al
M1

* Top 500 free applications per category only

Date of Snapshot
03/27/12

# Unique Apps 338

# Unique Domains
246

02/2012

596

281

03/26/2012

1,485

839

# Unique Domains 27,581 3,028 2,712 11,719 5,939
# Unique IPs 2,324 2,413 5,540

# Unique IPs 47,144 8,868 8,458 24,032 14,174

#RSAC
M&A Overlap with Wired pDNS

Wired Hosts

M&A Hosts
10%

 At most 10% of M&A hosts are outside our non-cellular pDNS dataset.
 More than 50% of M&A hosts are associated with at least seven domain names.
Mobile applications reusing same hosting infrastructure as desktop applications.

Lifecycle of a Threat
12000 10000
8000 6000 4000 2000
0

Volume of Lookups

Threat 

#RSAC
Point of Disclosure

Jun 18 Jun 04 May 21 May 07 Apr 23 Apr 09 Mar 26 Mar 12

Dates
 Threat publicly disclosed by security community in October.  Associated domain no longer resolved at time of disclosure.

Class A Index

#RSAC
Network Behavior
Threat 
220 200 180 160 140 120 100
80 60
Dates
 Mobile threats show high degree of network agility similar to traditional botnets. Use of network based countermeasures may help better detect and mitigate threats.

Jul 01 May 01 Mar 01 Jan 01 Nov 01 Sep 01
Jul 01 May 01 Mar 01 Jan 01

#RSAC
Summary of Observations
 Mobile Internet is really just the Internet.  Mobile malware is still a real but small threat.  Mobile applications reusing same infrastructure as desktop applications.  Analysis of mobile malware slow to identify threats.  Network based countermeasures can and should be used.

#RSAC
Apply What You Have Learned Today
 What you can do today:
 When downloading applications for your mobile device, try and stick to first-party application markets.
 Be mindful that certain threats like phishing can be more effective against mobile users due to limited screen real estate.
 What you should be doing in the future:
 Leverage your existing network infrastructure to help identify mobile devices.  Analyzing the network infrastructure mobile devices are contacting by using new or existing tools
to evaluate the reputation of that infrastructure.

#RSAC
Questions?

#RSAC
References
 The Core of the Matter: Analyzing Malicious Traffic in Cellular Carriers, Network & Distributed System Security Symposium (NDSS), 2013
 Mobile Malware Sources (Public)
 Contagio Mobile Malware (http://contagiominidump.blogspot.com)  Android Malware Genome (http://www.malgenomeproject.org)  VirusTotal (https://www.virustotal.com)

