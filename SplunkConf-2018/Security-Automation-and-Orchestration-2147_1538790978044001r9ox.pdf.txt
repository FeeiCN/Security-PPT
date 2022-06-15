© 2018 SPLUNK INC.
Make Your Sandbox Useful
Accelerate Your End-to-End Response Capabilities
Zach Sivertson Sr. Director, Product Management ­ Symantec
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Make Your Sandbox Useful
The Problem

The Problem
Sandboxing Systems are Slow
 Most Sandbox Systems are Slow  Average Sandbox Response Time
· Over 6 minutes (7 vendors tested) · Test done with system not under load · New/unknown malware · Sandbox vendors will tell you they are much faster
· Only for known malware IoC (URLs, file hashes, signatures etc.)

© 2018 SPLUNK INC.
Average Sandbox Response Time
(Unkn. Malware):
> 6 min

The Problem
Most Sandbox Systems are Not Real-Time
 Most sandbox systems don't block unknown malware in real-time · Many vendors will claim real-time blocking by: · Claiming victory by blocking known samples · Making end user wait or trickling file (w/ Proxy) to end user · Many are deployed off TAP port where only option is TCP reset
 Patient Zero (First client getting infected) · Creates a security response need · Clean up- initial infection · Prevent lateral spread

© 2018 SPLUNK INC.

The Problem
Too Many Alerts; SoC Teams are Overwhelmed

© 2018 SPLUNK INC.

 Sandbox systems can create lots of alerts that aren't prioritized or automated · Many vendors want systems deployed in-front Proxy or Firewall to "see everything"
 Don't know right away if you need to take action · Did the file reach the endpoint? · How do I prioritize thousands or alerts?

"Two-thirds of the time spent by security staff responding to
malware alerts is wasted because of faulty intelligence."
The Cost of Malware Containment - Ponemon Institute

The Problem
Too Many Alerts; SoC Teams are Overwhelmed

© 2018 SPLUNK INC.

Overwhelming Incident Response (IR) Queue
· Systems create alarms for all types of malware,
even common
· IR teams can't reach majority of alarms
· Doesn't "prevent" enough ­ "detect & respond"
is much more expensive process

Monthly alerts created
208K
Reliable 6.7% Investigated 1.9%

The Problem
Sandbox Responses are Not Automated

© 2018 SPLUNK INC.

 SoC Teams get thousands of sandbox alerts that require manual verification: · Did this file get blocked by some downstream security device? · How risky is this incident? · Is it more important than other items in my queue? · Should I act now? · How should I remediate this issue?

The Problem
This is where the subtitle goes

© 2018 SPLUNK INC.
1. Most Sandboxing Systems are Slow 2. Most Sandboxing Systems are not Real-Time 3. Patient Zero Occurs 4. Too Many Alerts 5. Response in Not Automated

© 2018 SPLUNK INC.
Make Your Sandbox Useful
Tips & Recommendations

Tip #1
Deploy Sandbox Behind Web Proxy
 Deploy Sandbox Solution Behind Web Proxies · Allows you to enable real-time blocking · Trickling of content to end user · Display patient pages to end user · E.g. Real time sandbox for exe, wait 60 sec, trickle data
 Find Solutions that Use Hybrid Sandbox Approach · Use both emulation and full OS detonation · Some emulation systems can take <1 second

© 2018 SPLUNK INC.

Tip # 2 Pre-filter & Customize
Deploy Sandbox Later in Your Security Stack
 Filter Samples Prior to Detonation · Keeps systems from getting overloaded · Overloaded systems can take >20min. · Reduces investment needed · Utilizes multi-layer inspection
 Greatly Reduces Alert Noise · Don't get alerts for things blocked by Firewall &
Proxy
 Customize Sandbox Detonation Chamber · Replicate golden image · Shows malware that would have triggered on
your image

© 2018 SPLUNK INC.

Tip # 3 Automate and Orchestrate
Automate Your Sandbox Response/Remediation

© 2018 SPLUNK INC.

 Top Reasons to Automate and Orchestrate Sandbox Response with PC:

1. Save Time: Confirm attack (that entered through the web, email or other) actually occurred on the endpoint
2. Prevent the Spread of an Attack: Blacklist attack via endpoint manager
3. Automate Remediation: Perform automated/1-click remediation of endpoints to save on SoC/I.T. resources

© 2018 SPLUNK INC.
User Story ­ Network to Endpoint IoC Verification

As a security administrator...
When I receive an alert from the sandbox I want to know what endpoints across my entire network have seen these same IoC's. This will shorten my indecent response time by preventing my team from performing unnecessary work to confirm if the malicious sample detonated on the endpoint.
Workflow: 1. Sandbox discovers a malicious sample & sends data to Phantom 2. Phantom queries endpoint to verify IoC across entire endpoint deployment (File Hash, Registry changes,
URL, process name, registry changes etc.) 3. The list of infected endpoints are then added to the sandbox report showing the admin not only what
happened in the sandbox but what endpoints are infected

Makes alerts more relevant More easily prioritize alerts

Know what endpoints are affected

© 2018 SPLUNK INC.
User Story ­ Endpoint Automated Blacklist
As a security administrator...
I want attacks that are discovered via the sandbox to be stopped from spreading to other endpoint devices.
Workflow: 1. Sandbox discovers a malicious sample with high certainty and send data to Phantom 2. Phantom reaches out to endpoint and blacklists that hash on all endpoints 3. This prevents the spread of this file to other endpoint devices

Automates basic security response

Saves time and resources

Increase security posture by decreasing lateral spread

User Story ­ Endpoint Remediation

© 2018 SPLUNK INC.

As a security administrator...
If a malicious sample (originally detected in the sandbox) has been detonated on an endpoint I want some level of automated remediation to take place until possible further action can be taken
Workflow: 1. Sandbox discovers a malicious sample and sends data to Phantom 2. Phantom queried endpoint to verify IoC on endpoints (File Hash, Registry changes, URL, process name,
registry changes etc.) 3. The list of infected endpoints are then added to the sandbox report showing the admin not only what happened
in the sandbox, but what endpoints are infected 4. Malicious samples are deleted, processes stopped, call back traffic blocked, registry keys changed in
order to help mitigate the damage until the device can be re-imaged 5. Automate contacting of employee to notify them that their machine needs to be re-imaged and to stop by the I.T.
Help Desk (Email, Slack, SMS etc.)

Automates more advanced response

Saves time and resources

Increase security posture by limiting exposure to patient zero

Tip #3 Demo
Tip # 3 Automate and Orchestrate

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
This is where the subtitle goes

1. Deploy Sandbox Behind Proxy · Enable real-time sandboxing · Better user experience w/ trickling

© 2018 SPLUNK INC.

2. Pre-filter Sandbox · Reduce alert noise · Save on deployment cost

3. Use Sandbox with Emulation & Full VM · Decrease time to verdict · Faster verdicts for real-time blocking

4. Use Sandbox w/ Custom Image Capabilities · Understand if malware would detonate on your gold image

5. Automate and Orchestrate Sandbox Response · Save Time: Confirm attack actually occurred on the endpoint · Prevent the Spread of an Attack: Blacklist attack via SEP Manager
(SEPM)
· Automate Remediation: Perform automated/1-click remediation of
endpoints to save on SoC/I.T. resources

Symantec Phantom Integration

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

