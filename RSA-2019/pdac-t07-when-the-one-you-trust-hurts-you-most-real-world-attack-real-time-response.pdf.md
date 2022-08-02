SESSION ID: PDAC-T07
When the One You Trust Hurts You Most: Real-World Attack, Real-Time Response

Bret Hartman
VP and CTO Cisco Security Business Group

Jyoti Verma
Technical Leader Cisco Security Business Group

#RSAC

#RSAC
"This is the new abnormal, and this new abnormal will continue."
Jerry Brown, Former California Governor

#RSAC
Fire Response Timeline

Fire

Detection

Containment/Triage Investigation

Prevention

1

2

3

4

Monitoring
3

#RSAC
Nyetya

Isabel PHleeyasBer,eyt,eys.t?LMThKinwkhwaet yhoauve saeper/ofibnldem. T.hHaenlkp.yIotu's. critical.

Hey Bret, yt? Think we have a problem. Help. It's critical.

#RSAC

Hi Isabel. In the middle of a talk at RSA. Will see what I can do. I have your login still from last week ­ let me take a look. Cool?
Delivered
Please, yes. LMK what you see/find. Thank you.
Hi Isabel. In the middle of a talk at RSA. Will see what I can do. I have your login still from last week ­ let me take a look. Cool?

Network Behavioral Analytics

#RSAC

Network Behavioral Analytics
2/27/19 3/5/19

#RSAC

2/27 2/28 3/1

3/2 3/3

3/4

3/5

2/27/19 2/27/19

3/5/19

02/27
02/27 02/27 02/27

#RSAC

Network Behavioral Analytics
2/27/19 3/5/19

#RSAC

2/27 2/28 3/1

3/2 3/3

3/4

3/5

Network Behavioral Analytics
2/27/19 3/5/19

#RSAC

2/27 2/28

3/1

3/2

3/3

3/4

3/5

Network Access Control

#RSAC

Network Behavioral Analytics

#RSAC

March 5, 2019 5:59:...

Host Groups: Production_Servers

Payload:

http://ret.space:80/checkin

Investigation
Investigation

#RSAC

Investigation
Investigation

#RSAC

Marc h 5th, 2019 Marc h 5th, 2019

FeFbeb2.72t7h,,22001919 MaMrcarhch55th, ,20210919

Feb. 27, 2019

March 2, 2019

March 5, 2019

Investigation
Investigation

#RSAC

Marchh 5tthh,, 2019 Marchh 5tthh,, 2019

FeFbeb2.72t7h,, 220019199 MaMrcarhc h55tth, ,,202210091199

Feb. 27, 2019

March 2, 2019

March 5, 2019

Investigatiion
Investigatioonn

March 5th, 2019 March 5th, 2019

February 27, 2019 March 5, 2019

#RSAC

Marc h 5th, 2019
Feb. 27, 2019
Marc h 5th, 2019

March 2, 2019

March 5, 2019

FeFbeb2.72t7h,,22001919 MaMrcarhch55th, ,20210919

Feb. 27, 2019

March 2, 2019

March 5, 2019

Investigation
Investigation

#RSAC

Marc h 5th, 2019 Marc h 5th, 2019

FeFbeb2.72t7h,,22001919 MaMrcarhch55th, ,20210919

Feb. 27, 2019

March 2, 2019

March 5, 2019

Investigation
Investigation

#RSAC

MMaarrcchh55thth,,22001199 MMaarrcchh 55tthh,,22001199

FeFFbeebb2.r72ut7ha,,r2y20021791,992019 MaMMrcaarhrcchh55tth5, ,,,2022210009111999

FFFeeebbb...222777,,,222000111999

MMMaaarrrccchhh222,,,222000111999

MMMaaarrrccchhh555,,,222000111999

#RSAC

#RSAC

Datacenter server 10.201.3.83

John Doe

#RSAC
Automated Playbook
Detection, Containment and Remediation
21

Pre-processing
Preprocessing

Network Behavioral Analytics (NBA) Alert
Start
Extract artifacts from Alert(Source information) Query NBA (source IP sessions with alert time window)
Extract external IPs from the session list

Mitigation Perimeter block

Add IP to watch-list

Query Threat intelligence sources for additional artifacts

Annotate Incident Context Notes about Malware

IP Reputation check
Malicious IP found?
Yes No

22

#RSAC
Automated
Manual

Triage and Containment

Mitigation ­ Quarantine

Yes

Needs

No

infected host

Triage?

Triage

Query NBA (internal sessions for source IP around time window)

Hunt IOCs

Identify infected hosts

Add alert source to watch list

Mitigation Quarantine & Notification
Containment ­ add blocking ACL for identified hosts
Remediation

Notify Affected Internal Users

Create Ticket for IR

23

#RSAC
Automated Manual
Update The Ticket Close NBA Alert
End

#RSAC
Response Recap

Fire Supply Chain
Attack

Detection Network Behavioral Analytics
1

Containment/Triage Network
Access Control
2

Investigation Visibility
3

Remediation Endpoint
Detection Response
4

Network Monitoring

#RSAC
Lessons Learned

Supply Chain

No Borders

Machine Speed

25

#RSAC
Apply It
· Now: Study up!
· Ongoing standards:
· NIST Cybersecurity Framework · MITRE ATT&CK Framework · OASIS - STIX, OpenC2 · CACAO
· RSA Sessions
· Three Months: Do you have the right foundation?
· Assess the detection and response systems within your own organization and determine if you have enough in place.
· Six Months: How would you apply what you have to a more automated environment?
26

Thank you.

How to Support Fire Victims American Red Cross www.redcross.org

