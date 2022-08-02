How to Ruin Your Weekend (and your Business) in few simple steps
PRZEMEK JAROSZEWSKI CERT POLSKA / NASK
29. ANNUAL FIRST CONFERENCE. SAN JUAN, PUERTO RICO. JUNE 14, 2017

Chapter I

Fast Forward
 FAST FORWARD is a logistic company that handles many types of shipments, such as:
 Food supplies (HORECA)  Medical (Pharmacies and Hospitals)  Documents (Legal and Consulting)

A lazy Sunday afternoon in summer
3 hours later...

What was officially "known"
 Attacks disrupted IT systems used for planning and delivery of manifests to central databse
 Other systems were not affected  Attacks "blocked Fast Forward's network". In effect, manifests could not be
submitted to coordination office and shipment plans were not generated.  The incident was mitigated within twenty-four hours.  200+ businesses were affected, understocked or unable to provide daily
operations

Fast Forward operations
 Each regional office submits tickets based on customer schedules and individual orders
 To a dedicated server application via WEB API  Over VPN (gateway at the central office)
 Shipments are bundled and coordinated at the central office within certain constraints, based on:
 Availability of supplies at different locations  Route optimization  Time efficiency
 Plans are sent to local offices which dispatch vehicles to collect and deliver shipments

Chapter II

The story unfolds...
 Fast Forward was in the process of migration of its firewalls (from different vendor).
 Volume of traffic to ISPs was increasing within days after the new firewall was in production environment.
 Day -1. The network is congested. This is addressed by filtering a number of "attacking" hosts on the firewall.
 Day 0. The network becomes unresponsive.  Day 1. Old firewalls are restored which resolves the problem.
TLP: RED

The Firewall
 Logs are not much help 
 Logging was initially disabled for most rules.  Storage space not correctly configured on the analyzer.  We had about 7 minutes of logs.
 Summary reports show that most traffic was outgoing DNS via UDP.

Let's go deeper...
 FortiGate has rule counters
config firewall vip edit "vip-203.0.113.2" set uuid 3034c832-e61a-51b4-a925-f4fe0e4d3728 set extip 203.0.113.2 set extintf "any" set mappedip "10.23.80.9" next
end
config firewall policy edit 1055 set uuid def93232-fa43-91e4-40a6-a6ee99322b5a set srcintf "any" set dstintf "any" set srcaddr "all" set dstaddr "vip-203.0.113.2" set action accept set schedule "always" set service "ALL" set logtraffic disable next

What is 203.0.113.2?
 "Good question! We're not quite sure."  mercury.fastforward.pl ­ used to be an all-purpose
server "back in the old days", handling mail, DNS, etc.  For legacy reasons the original firewall translated its
address to the internal DNS server, but only for DNS traffic from internal networks and VPNs.  The "rule 1055" was apparently a mistranslation...

Let's look at DNS server logs

Wrap up (for now)
 Confirmed that DNS amplification killed the network.  DNS amplification was done on an internal DNS server, never meant
to speak to the world.  The mistranslated rule was not picked up by tests.
 It was the fourth attempt to push to production.  Everyone was focused on getting the traffic they want through. (Not on
checking whether new holes are opened).  Full tests, tweaks like traffic shaping etc. were scheduled for later.
 Switching back to the old firewall was accepted as solution.

Chapter III

Let's go even deeper...
 Was Fast Forward targeted? Likely not.

How could this be prevented?
the less obvious observations
 A cheap laptop with a 3G modem would be a perfect workaround for communication with central office.
 Network monitoring goes long ways!
 Open DNS server at 203.0.113.2 was reported in data feeds (including n6!) within hours after new firewall was put in production... and three weeks earlier, during failed attempts.
 Login attempts (failed) to SSH root account were in the server logs.
TLP: RED

Organisational issues
 IT maintenance and monitoring was outsourced to Company X
 Firewall migration was contracted to Company Y
 Company X was aware of firewall migration, yet it did not pick up any signs of incoming problems
 Each company had its contractual obligations, but clearly nobody was enforcing them

Chapter IV

Open questions
 How to deal with monitoring and incident response when IT is almost completely outsourced?
 Why was this particular DNS server so heavily exploited?
 Are there any ranks of identified open amplifiers?

How to contact us
 web: www.cert.pl, n6.cert.pl  mail: info@cert.pl  twitter: @CERT_Polska, @CERT_Polska_en  facebook: fb.com/CERT.Polska  youtube: CERTPolska
 Przemek.Jaroszewski@cert.pl

