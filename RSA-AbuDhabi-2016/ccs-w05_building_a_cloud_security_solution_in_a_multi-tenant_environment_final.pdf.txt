SESSION ID: CCS-W05
Building a Cloud Security Solution in a Multi-Tenant Environment
#RSAC

David Andrews
Lead Engineer ­ Security Core Verizon Digital Media Services @daveisangry | @VerizonDigital

#RSAC
Why Should You {stay,go}?
But first...what can you expect from this talk? 1· Insight into our architecture
· Skip scalability iterations
2· Lessons learned from multi-tenant ModSecurity 3· Practical tips for event log delivery (via rsyslog)
2

#RSAC
<structured_talk_is_structured>
· Intro to Content Delivery Networks and WebSec | 3 minutes · EdgeCast Network WebSec | 20 minutes · Forging in the white-hot fires of Production | 20 minutes · Conclusion and Questions | the rest of the time...
3

#RSAC
Content Delivery Networks and WebSec
In the beginning there were websites...
So simple ...
4

#RSAC
Content Delivery Networks and WebSec
In the beginning there were websites...
So simple ... Uh oh, people want to use it from everywhere!
5

#RSAC
Content Delivery Networks and WebSec
Enter the Content Delivery Network (CDN)
Scalable Global
6

#RSAC
Content Delivery Networks and WebSec
Enter the Content Delivery Network (CDN)
Scalable Global
7

#RSAC
Content Delivery Networks and WebSec
Enter the Content Delivery Network (CDN)
Scalable Global Multi-tenant
8

#RSAC
Content Delivery Networks and WebSec
Oh there is money on the Internet?!
Great! ... And now we need a firewall...
9

#RSAC
Content Delivery Networks and WebSec
Oh there is money on the Internet?!
Great!
...
And now we need a firewall...
And now we need a bigger one!
10

#RSAC
Content Delivery Networks and WebSec
We can just pay someone else to do this?
We're already paying that CDN thing...
11

#RSAC
The Task: WebSec on our CDN
· WebSec for Verizon's Edgecast Content Delivery Network (Verizon CDN)
· Project 0: WAF · Same features as on-premise
solutions (of course)
· Real-time configuration updates · Real-time dashboards · Highly customizable
· Nevermind that it's somewhat more complicated...
12

#RSAC
Edgecast Network WebSec - Early Decisions
· ModSecurity WAF
· Open source, active community · Excellent rulesets available (OWASP, Trustwave) · Allows for encapsulated instances
· Runs as a module in Sailfish
· Our HTTP server · For the performs
13

#RSAC
Edgecast Network WebSec - Config Updates
· Real-time requirements
· Need to balance risk vs. flexibility
· Update between requests
· Load new instance, replace old · Immediate code changes required to
support this with no leaks
· Customers have two instances: Audit and Production
· Allows seamless staging and promoting to prod
14

#RSAC
Edgecast Network WebSec - Config Updates
Atomic JSON Configs
· Verifiable · Extensible · All the good JavaScript things
15

#RSAC
Edgecast Network WebSec - Config Updates
Atomic JSON Configs
Compiled down to native ModSecurity rules format by Sailfish right before loading
16

#RSAC
Edgecast Network WebSec - Config Updates
Atomic JSON Configs
Compiled down to native ModSecurity rules format by Sailfish right before loading
17

#RSAC
Edgecast Network WebSec - Config Updates
Atomic JavaScript Configs
Compiled down to native ModSecurity rules format by Sailfish right before loading
18

#RSAC
Edgecast Network WebSec - Config updates
Rulesets re-used by many compiled configs
19

#RSAC
Edgecast Network WebSec - Dashboard
Event logging stack
First version
20

#RSAC
Forging in the White-hot Fires of Production
CPU utilization issues...
21

#RSAC
Forging in the White-hot Fires of Production
CPU utilization issues...
22

#RSAC
Forging in the White-hot Fires of Production
Tue May 19 20:28:29 dandrews@dandrews:~/Work/dev/git/play/apr$ grep configure apr-1.4.6/debian/rules ./configure --host=$(DEB_HOST_GNU_TYPE)
--build=$(DEB_BUILD_GNU_TYPE) --enable-layout=Debian --includedir=\$${prefix}/usr/include/apr-1.0 --with-installbuilddir=\$${prefix}/usr/share/apr-1.0/build --enable-nonportable-atomics --enable-allocator-uses-mmap
CPU utilization issues...
23

#RSAC
Forging in the White-hot Fires of Production
CPU utilization issues...
24

#RSAC
Forging in the White-hot Fires of Production
Fix deployed
CPU utilization issues...
25

#RSAC
Forging in the White-hot Fires of Production
Managing Ruleset Updates · Upstream updates regular
and unpredictable · Fast turnaround required · Rules as code: ~3 day canary · Data as config: daily push
26

#RSAC
Forging in the White-hot Fires of Production
Managing Ruleset Updates
· Date-based versioning · 160111 -> 2016, Nov., first release
· Low maintenance options · Meta-versions · Latest, Latest-Beta
27

#RSAC
Forging in the White-hot Fires of Production
Managing Ruleset Updates
· Date-based versioning · 160111 -> 2016, Nov., first release
· Low maintenance options · Meta-versions · Latest, Latest-Beta
28

#RSAC
Forging in the White-hot Fires of Production
Managing Ruleset Updates
· Date-based versioning · 160111 -> 2016, Nov., first release
· Low maintenance options · Meta-versions · Latest, Latest-Beta
29

#RSAC
Forging in the White-hot Fires of Production
WAF uptake accelerates
Memory utilization issues...
30

#RSAC
Forging in the White-hot Fires of Production
Many systems run out of memory entirely and crash
Memory utilization issues...
31

#RSAC
Forging in the White-hot Fires of Production
Test and trial WAFs cleaned up to recover
Memory utilization issues...
32

#RSAC
Forging in the White-hot Fires of Production
Development of solution finishes...
Memory utilization issues...
33

#RSAC
Forging in the White-hot Fires of Production
First canary of solution starts
Memory utilization issues...
34

#RSAC
Forging in the White-hot Fires of Production
Yay!
Memory utilization issues...
35

#RSAC
Forging in the White-hot Fires of Production

Memory Utilization Issues
· Every (encapsulated) WAF allocated duplicate rules & associated structures
· Significant code changes required to fix

Diff Stats
$ git diff --shortstat 6391962..c457ef3 -- modsecurity/

9 files changed
417 deletions (-)

698 insertions (+)

36

#RSAC
Forging in the White-hot Fires of Production
Event Logging Iterations
37

#RSAC
Forging in the White-hot Fires of Production
Event Logging Iterations
38

#RSAC
Forging in the White-hot Fires of Production
Event Logging Iterations
39

#RSAC
Forging in the White-hot Fires of Production

Event Logging Issues
· rsyslog bugs
· busy loops, stuck states

Some fixes

40

#RSAC
Forging in the White-hot Fires of Production

Event Logging Issues
· rsyslog bugs
· busy loops, stuck states
· Disk-assisted queues, yay
· TLS without blocking system logging

Example

41

#RSAC
Forging in the White-hot Fires of Production

Event Logging Issues
· rsyslog bugs
· busy loops, stuck states
· Disk-assisted queues, yay
· TLS without blocking system logging
· ... not perfect, they get {slow,corrupt} at times

Tools
https://github.com/rsyslog/rsyslog/blo b/master/tools/recover_qi.pl
https://github.com/VerizonDigital/rsysl og/blob/master/tools/fix_daq_and_res tart.sh

42

#RSAC
Conclusions
· ModSecurity allowed us to bootstrap quickly
· But repeated {identification,fixing} for multi-tenancy is expensive
· Configuration layout, memory usage, CPU usage
· Due to {cruft,complexity} open source project waflz replacement
· First release was July 2016
· Parse ModSecurity config language · Product well-structured documents (json, protocol buffers)
· Next major release planned for Q2 2017
· Goal: replace ModSecurity on the edge
43

#RSAC
Applicable Tips
· Next week, you could...
· Ensure you're at the latest stable in your logging infrastructure
· Add disk assist for log delivery · Add event log timestamping (collection vs. ingest) to capture lag
· Next three months, you could...
· Monitor more: CPU, memory, config reloads, event log traffic, etc. · Set limits on config reload rates to protect against unknown issues
· Next six months, you could...
· Participate in waflz v1.0 development! https://github.com/VerizonDigital/waflz
44

#RSAC
Thank You

