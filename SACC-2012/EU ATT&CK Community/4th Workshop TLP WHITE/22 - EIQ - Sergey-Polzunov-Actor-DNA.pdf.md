Generating MITRE ATT&CK DNA for groups of actors
Sergey Polzunov, EclecticIQ

Hypotheses
· There are differences in styles of operation on a threat actor / intrusion set level
· These differences can be detected when we compare ATT&CK techniques observed in campaigns
· Subtle differences on a threat actor level become more pronounced when actors are grouped together (by nation state, for example)

Algorithm
· Requirements:
· Data with connected STIX entities, CTI data model on top of STIX and taxonomies (MITRE ATT&CK, etc)
· Define seed entities:
· specific threat actors, grouped in datasets (nation states)
· Generate contexts:
· Walk the graph from the seeds, identify relevant entities, filter out irrelevant ones, count taxonomy nodes seen in entities
· Calculate TF-IDFS for ATT&CK techniques seen in the contexts · Merge most interesting techniques per actor into a group's techniques set

Threat Actor Context

Seed entity

Histograms  TF-IDF

· Most popular (for the actor) exotic (across all) techniques used

TF (term) = Term Frequency (term) = # "# $%&'( $')& *++'*)( %, $-' ."/
$"$*0 # "# $')&( %, $-' ."/

IDF (term) = Inverse Document Frequency (term) =

(

$"$*0 # "# ."/

)

# "# ."/( /",$*%,%,5 $')&

TF-IDF (term) = TF (term) * IDF (term)

TF-IDFs vectors per actor context

TF-IDF 2,33289044 1,57675973 1,57675973 1,26640917
1,1273593 1,05117315 0,94980688 0,92665868 0,74150134 0,74132694
0,7256059

ID 1328 1254 1210 1308 1438 1443 1345 1203 1460 1192 1431

Technique Buy domain name Conduct active scanning Exploitation of Remote Services Acquire and/or use 3rd party software services Alternate Network Mediums Remotely Install Application Create custom payloads Exploitation for Client Execution Biometric Spoofing Spearphishing Link App Delivered via Web Download

Disclaimer
· The data has noise in it:
· Old techniques use same numeric IDs as new ones · Mistyped ATT&CK IDs · Incorrectly tagged entities · Incorrect relations between entities
· The results here are only from the data we have in our DB · The methodology and our data is surely full of biases

China

ID
1431 1476 1433 1402 1262 1422 1497 1430 1254 1210

Normalised TF-IDFs Tech App Delivered via Web Download Deliver Malicious App via Other Means Access Call Log App Auto-Start at Device Boot Enumerate client configurations System Network Configuration Discovery Virtualization/Sandbox Evasion Location Tracking Conduct active scanning Exploitation of Remote Services

ID 1328 1254 1210 1308 1438 1443 1345 1203 1460 1192

Simple TF-IDFs Tech Buy domain name Conduct active scanning Exploitation of Remote Services Acquire and/or use 3rd party software services Alternate Network Mediums Remotely Install Application Create custom payloads Exploitation for Client Execution Biometric Spoofing Spearphishing Link

ID 1328 1203 1193 1438 1192 1254 1210 1363 1461 1308

Sublinear TF-IDFs Tech Buy domain name Exploitation for Client Execution Spearphishing Attachment Alternate Network Mediums Spearphishing Link Conduct active scanning Exploitation of Remote Services Port redirector Lockscreen Bypass Acquire and/or use 3rd party software services

China and Russia, techniques per dataset

CHINA ID Tech 1192 Spearphishing Link 1193 Spearphishing Attachment 1203 Exploitation for Client Execution 1210 Exploitation of Remote Services 1254 Conduct active scanning 1262 Enumerate client configurations 1308 Acquire and/or use 3rd party software services 1328 Buy domain name 1345 Create custom payloads 1363 Port redirector 1402 App Auto-Start at Device Boot 1422 System Network Configuration Discovery 1430 Location Tracking 1431 App Delivered via Web Download 1433 Access Call Log 1438 Alternate Network Mediums 1443 Remotely Install Application 1460 Biometric Spoofing 1461 Lockscreen Bypass 1476 Deliver Malicious App via Other Means 1497 Virtualization/Sandbox Evasion

ID 1176 1190 1192 1193 1204 1219 1328 1332 1334 1347 1350 1419 1424 1430 1461 1465 1468 1489

RUSSIA Tech Browser Extensions Exploit Public-Facing Application Spearphishing Link Spearphishing Attachment User Execution Remote Access Tools Buy domain name Acquire or compromise 3rd party signing certificates Compromise 3rd party infrastructure to support delivery Build and configure delivery systems Discover new exploits and monitor exploit-provider forums Device Type Discovery Process Discovery Location Tracking Lockscreen Bypass Rogue Wi-Fi Access Points Remotely Track Device Without Authorization Service Stop

What's next
· Improve the method, compensate for biases · Automatically highlight potentially interesting techniques to threat analysts conducting
analysis · Similarity estimation
· Using TF-IDF vectors for calculating similarity between activities of actors
· Use sub-techniques to increase the granularity · Compare techniques for selected actors with the ones listen in MITRE ATT&CK groups

Questions?
sergey@eclecticiq.com

