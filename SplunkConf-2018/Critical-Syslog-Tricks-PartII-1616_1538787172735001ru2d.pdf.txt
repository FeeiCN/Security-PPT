© 2018 SPLUNK INC.
Critical Syslog Tricks, Part II
(That No One Seems to Know About)
Jonathan Margulies | Citadel LLC, Former Splunk Professional Services Consultant George Barrett, PhD | Splunk Professional Services Consultant at Rational Cyber October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Citadel Disclaimer

© 2018 SPLUNK INC.

 This presentation reflects the analysis and views of the authors. No recipient should interpret this presentation to represent the general views of Citadel or its personnel. Facts, analysis, and views presented in this presentation have not been reviewed by, and may not reflect information known to, other Citadel professionals.
 Assumptions, opinions, views, and estimates constitute the authors' judgment as of the date given and are subject to change without notice and without any duty to update. Citadel is not responsible for any errors or omissions contained in this presentation and accepts no liability whatsoever for any direct or consequential loss arising from your use of this presentation or its contents.

A Quick Note About These Slides

© 2018 SPLUNK INC.

 Last year, we presented a talk on our bulletproof method for collecting syslog data into Splunk using syslog-ng
 This year, we have so much new stuff that we have no time to go over the old stuff
 But our new stuff builds so heavily on last year's presentation that, especially for people viewing these slides after the conference, we wanted to put it all together as one cohesive guide to collecting syslog data in the enterprise
 With that in mind, any slides that don't contain new material will have a gray background, and slides that do contain new material will have a white background

© 2018 SPLUNK INC.
Do You Have a Syslog Collection Problem?

© 2018 SPLUNK INC.
You Might Have a Syslog Collection Problem If...
 Your syslog data arrives in Splunk more than a few seconds after the event time  Syslog data that comes in while Splunk is restarting gets dropped  You notice gaps or missing events in your syslog data feeds  You need a new listening port every time you get a new syslog data source  Your indexers or heavy forwarders have to look in raw events to figure out what
index, sourcetype, or host to assign to those events  Multiple hosts' syslog data are being aggregated under the same host because
they came through the same syslog server  Your IT people use grep instead of Splunk to troubleshoot live issues

Syslog Brings in Your Most Important Logs

© 2018 SPLUNK INC.

What You'll Learn From This Presentation

© 2018 SPLUNK INC.

 Last year:
· How to configure syslog-ng to collect all your syslog data for Splunk · How to architect your syslog collection infrastructure · How to configure Splunk to collect all the data from syslog-ng and index it in about 3 seconds · How to find and troubleshoot syslog collection problems quickly
 This year:
· Updates and fixes! · Our new rsyslog.conf for syslog-ng haters · Automatic sourcetyping and timezoning · Our new monitoring app · How to use everything we've built · HEC and Kafka

© 2018 SPLUNK INC.
syslog-ng and rsyslog

A Few Things to Note About syslog-ng

© 2018 SPLUNK INC.

 It's free. There's a paid version, but this presentation assumes you didn't buy it.  We recommend version 3.5 or higher, as that supports multithreading and some other
useful features  You can do everything we're recommending using rsyslog instead, but we don't
recommend it
· syslog-ng handles poorly formatted syslog events more gracefully · That said, we'll show you how to do it anyway
https://syslog-ng.org/ https://www.balabit.com/documents/syslog-ng-ose-latest-guides/en/syslog-ng-ose-guideadmin/html/index.html
This link doesn't work anymore because someone not named Splunk bought Balabit. New link: https://www.syslog-ng.com/technical-documents/doc/syslog-ng-open-sourceedition/3.16/administration-guide

Configuring syslog-ng (options)
options { flush_lines (100); time_reopen (10); log_fifo_size (1000); chain_hostnames (off); use_dns (no); use_fqdn (no); create_dirs (yes); keep_hostname (yes); threaded (yes);
};
https://gitlab.com/rationalcyber/syslog-ng-configuration/blob/master/syslog-ng.conf

© 2018 SPLUNK INC.

Configuring syslog-ng (Listening and Writing)

© 2018 SPLUNK INC.

source s_aggregation { network(ip(0.0.0.0) transport(tcp) port(514)); network(ip(0.0.0.0) transport(udp) port(514));
};
destination d_splunkf { file("/mnt/$LOGHOST/log/$R_YEAR-$R_MONTH-
$R_DAY/$HOST_FROM/$HOST/$FACILITY.log" dir-owner("splunk") dirgroup("splunk") owner("splunk") group("splunk")); };

This Is The Most Important Line!

© 2018 SPLUNK INC.

file("/mnt/$LOGHOST/log/$R_YEAR-$R_MONTH$R_DAY/$HOST_FROM/$HOST/$FACILITY.log" dir-owner("splunk") dir-group("splunk") owner("splunk") group("splunk"));
 /$LOGHOST
· Essentially, "the hostname of this syslog-ng server." You're going to be collecting syslog
on more than one server, so this will help with troubleshooting.  /log/$R_YEAR-$R_MONTH-$R_DAY
· This is important for log rotation. We'll explain that on its own slide.
 /$HOST_FROM
· "The host I received this feed from." It may be the same as the originating host, or it may
be an intermediate syslog server. In the latter case, helps with troubleshooting.

The Rest of That Line

© 2018 SPLUNK INC.

file("/mnt/$LOGHOST/log/$R_YEAR-$R_MONTH$R_DAY/$HOST_FROM/$HOST/$FACILITY.log" dir-owner("splunk") dirgroup("splunk") owner("splunk") group("splunk"));
 /$HOST
· "The hostname from the syslog header." This may be an actual hostname, FQDN, or IP
address, but it's always the most reliable source of the logs' originating host.  /$FACILITY.log
· "The syslog facility setting." This generally isn't useful by itself, but it can almost always be
used in combination with $HOST to separate different sourcetypes from the same host.  dir-owner("splunk") dir-group("splunk") owner("splunk") group("splunk")
· Splunk should never be running as root! Make sure the splunk user can read and rotate all the
log files.

Rotating Logs

© 2018 SPLUNK INC.

 Do not use logrotate on a syslog server
· It will restart syslog-ng and you'll lose a couple of seconds of logs · https://www.syslog-ng.com/technical-documents/doc/syslog-ng-open-source-
edition/3.16/administration-guide/86#TOPIC-956714
· https://www.balabit.com/documents/syslog-ng-ose-latest-guides/en/syslog-ng-
ose-guide-admin/html/example-logrotate.html  Use these cron jobs instead (adjust the times as needed):
#cron job 1: at 5am, find yesterday's logs, and move them to old_logs 0 5 * * * /usr/bin/find /mnt/*/log/????-??-?? -maxdepth 0 -type d ! -mmin -300 -exec bash -c 'dir={}; old=${dir/\/log\//\/old_logs\/}; mv ${dir} ${old}' \;
#cron job 2: find any files older than 5 days, 23 hours, and delete them 0 4 * * * /usr/bin/find /mnt/*/old_logs/????-??-?? -maxdepth 0 -type d ! -mmin -8580 -exec rm -rf {} \;

© 2018 SPLUNK INC.
A Small Improvement to Our Directory Structure
 The flaw in our old date-handling is that caused the source field in Splunk to proliferate with otherwise identical sources being separated by different dates
 The solution: Use symlinks to alias the directory named for today's date to "today" (and the same for "yesterday") and have Splunk monitor the "today" and "yesterday" directories instead

New Cron Job

© 2018 SPLUNK INC.

 0 0 * * * rm -f /mnt/*/log/today /mnt/*/log/yesterday; ln -fs `date +\%Y-\%m-\%d` /mnt/*/log/today; ln ­fs `date -d yesterday +\%Y-\%m/-%d` /mnt/*/log/yesterday
 The result is way fewer and more meaningful sources:

Our Rsyslog Configs

© 2018 SPLUNK INC.

 Everything we're doing in rsyslog is intended to achieve the same results as our syslog-ng configuration--just different syntax
 Warning: When it comes to automatic directory creation (which is critical to our method of Splunk syslog collection), rsyslog does not handle raw data (i.e., any log message that lacks a proper syslog header) as gracefully
· We have not found a fix for this
· If using rsyslog, test improperly formatted syslog data carefully
· If rsyslog receives raw data using our configs, it may create directory names based on
seemingly random portions of the message that it mistakes for hostnames

Rsyslog Config Highlights

© 2018 SPLUNK INC.

 Configures the proper directory hierarchy, as discussed earlier for syslog-ng
template(name="DateHostFacility" type="string" string="/mnt/%$myhostname%/log/%$YEAR%%$MONTH%-%$DAY%/%FROMHOST%/%HOSTNAME%/%syslogfacility-text%.log")
 Apply the directory template from the bullet above, and set the proper file permissions
ruleset(name="splunk") { action( type="omfile" dirCreateMode="0755" fileGroup="splunk" dirGroup="splunk" fileOwner="splunk" dirOwner="splunk" DynaFile="DateHostFacility") template="FileFormat" }

Rsyslog Configuration Highlights

© 2018 SPLUNK INC.

 Tell rsyslog to listen on TCP/UDP port 514 and apply the "splunk" ruleset defined on the previous slide
input( name="syslog_tcp" type="imtcp" port="514" ruleset="splunk"
) input(
name="syslog_udp" type="imudp" port="514" ruleset="splunk" )

Rsyslog Configuration Highlights

© 2018 SPLUNK INC.

 Tell rsyslog not to append a syslog header to the front of events with invalid syslog headers · When rsyslog adds its own syslog header, it breaks timezones and adds worthless data to
your license
template(name="FileFormat" type="list") { property(name="rawmsg-after-pri") constant(value="\n")
}

© 2018 SPLUNK INC.
Architecting Syslog Infrastructure for Splunk

Network Architecture

© 2018 SPLUNK INC.

What Kind of Forwarder?
Heavy vs Universal

© 2018 SPLUNK INC.

Heavy Forwarder Advantages
 Can handle timezone conversions  Keep your props and inputs together
 Takes load off your indexers  PII masking  Minimize indexer restarts on config
changes

Universal Forwarder Advantages
 Need a lot less bandwidth to the indexing tier
 Less metadata  Less processor/memory load on the syslog
servers

© 2018 SPLUNK INC.
Configuring the Forwarder

inputs.conf
[monitor:///mnt/*/log/*day/*/fireeye*/local2.log] host_segment = 6 index = idps sourcetype = fe_cef_syslog
[monitor:///mnt/*/log/*day/*/mail*/*] host_segment = 6 index = mail sourcetype = sendmail_syslog

© 2018 SPLUNK INC.

props.conf
[source::/mnt/*/log/*/*/fireeye*/local2.log] SHOULD_LINEMERGE = false TZ = UTC
[source::/mnt/*/log/*/*/mail*/*] SHOULD_LINEMERGE = false TZ = US/Eastern

© 2018 SPLUNK INC.

outputs.conf

© 2018 SPLUNK INC.

 Most of Splunk's pipeline queues default to a maximum size of 512KB. That may be fine for a universal forwarder monitoring local OS logs, but not for a syslog server.
 Is your output queue too small?
index=_internal host=<syslog_server> source=*metrics.log group=queue name=tcpout* | eval output_queue_pct=current_size/max_size*100 | timechart perc95(output_queue_pct) by host | eval Bad=80
 A 64MB output queue works well for many enterprise syslog servers, but you may need more (if your 64MB queue is filling up) or less (if your RAM is filling up)
 Outputs.conf contents:
[tcpout]
maxQueueSize = 64MB

server.conf

© 2018 SPLUNK INC.

 Like the outputs queue, most Splunk queues default to a maximum size of 512KB, which is often insufficient for a syslog server.
 Contents of server.conf:
[queue] maxSize = 64MB
 Be sure to take into account the number of active pipelines! · We discuss parallel ingestion pipeline configuration in a later slide

limits.conf

© 2018 SPLUNK INC.

 Don't forget to configure your limits.conf!  If you use a universal forwarder, the maximum speed (per pipeline) defaults to 256kbps
· That value will likely be insufficient for your syslog monitoring, so remove restrictions:
[thruput] maxKBps = 0
 The maximum number of file descriptors that an ingestion pipeline in Splunk will keep open (per pipeline) defaults to 100 · If you're listening to this talk, this won't be enough; you'll likely need thousands · Use `find . | wc ­l` in the /log directory to help you determine what this should be, but a
few thousand is often a safe bet [inputproc] max_fd = <integer>

Better Balance Across Indexers

© 2018 SPLUNK INC.

 For better load balancing, have the forwarders change indexers often and mid-stream  outputs.conf:
[tcpout] autoLBFrequency = 5 autoLBVolume = 100000000 forceTimebasedAutoLB = true
 On UFs running 6.5+, do not use forceTimebasedAutoLB. Add this to props.conf for each data source (or in [default]) instead:
EVENT_BREAKER_ENABLE = true
https://www.splunk.com/blog/2014/03/18/time-based-load-balancing.html

Parallel Ingestion Pipelines

© 2018 SPLUNK INC.

 Parallel ingestion pipelines allow Splunk to use more resources so it can ingest multiple streams of data at once
 Since these syslog servers are dedicated to Splunk data collection, they're excellent candidates for this feature
 The number of pipelines you set will depend on your hardware capacity and data rates. See notes on side effects of this setting at https://docs.splunk.com/Documentation/Splunk/latest/Admin/Serverconf
 Enabling parallel ingestion pipelines in server.conf:
[general]
parallelIngestionPipelines = 2

© 2018 SPLUNK INC.
Automation
Scaling your Sysloging Splunk Infrastructure as Code

Syslog at Scale

© 2018 SPLUNK INC.

 In a large enterprise, do not build syslog inputs and props manually! · With thousands of syslog feeds, they become impossible to manage · Small typos can cause massive failures
 We manage all of our syslog inputs in a CSV file · Human and machine readable · Easier to sort, group, find entries, and identify errors
 Find our script to auto-generate inputs.conf and props.conf for syslog servers at: · https://gitlab.com/rationalcyber/

Using a Catchall Index

© 2018 SPLUNK INC.

 Sometimes upstream syslog sources start sending data you weren't expecting  You want this data in Splunk, but you don't know what index or sourcetype to
give it  inputs.conf:
[monitor:///mnt/log/*/*day] blacklist = (fireeye.*/local2\.log)|(mail.*/.*) index = catchall
 This blacklist regex becomes unmanageable quickly; the script on the previous slide auto-generates it for you
 It is often OK to assign the same index as lastChanceIndex even though this is a different usecase

Monitoring and Alerting

© 2018 SPLUNK INC.

 Problems with one of the Splunk syslog servers (run every few minutes):
| tstats count where source=/mnt/*/log/* by source | rex field=source "/mnt/(?<splunk_syslog_server>[^/]+)/" | stats sum(count), count by splunk_syslog_server
 Problems with an upstream syslog server (run every few minutes):
| tstats count where source=/mnt/*/log/* by source | rex field=source "/mnt/[^/]+/log/[^/]+/(?<upstream_syslog_server>[^/]+)/" | stats sum(count), count by upstream_syslog_server
 Queues filling up and causing delays (observe daily--look for sustained issues):
index=_internal host=<syslog_server> source=*metrics.log group=queue | eval queue_pct=if(isnull(current_size_kb), (current_size/max_size), (current_size_kb/max_size_kb))*100 | timechart limit=50 perc99(queue_pct) by name | eval Bad=80
 Unknown syslog feeds (observe daily):
| tstats count where index=catchall by source

Our New "Syslog Tools for Splunk" App!

© 2018 SPLUNK INC.

Automatic Sourcetyping

© 2018 SPLUNK INC.

 Most of your syslog data sources are probably off-the-shelf products common to lots of Splunk environments
 A lot of the syslog data that ends up in your catchall index will probably be more of those same products--you just need to identify them
 For many of these products, Splunkbase already has add-ons you can drop in and get perfect parsing right away
 Can we take advantage of these facts?

Automatic Sourcetyping
 Trick #1: Keyword searches (note the yellow highlights)

© 2018 SPLUNK INC.

 Trick #2: Punct

Automatic Sourcetyping

© 2018 SPLUNK INC.

Automatic Sourcetyping

© 2018 SPLUNK INC.

Automatic Timezoning
 What would need to figure out what timezone a host is logging in · What time does the host think it is right now?

© 2018 SPLUNK INC.

Automatic Timezoning
 What timezone does Splunk think the host is set to?  What time does Splunk think it is right now?

© 2018 SPLUNK INC.

Automatic Timezoning

© 2018 SPLUNK INC.

Automatically Generate Inputs CSVs

© 2018 SPLUNK INC.

We Need Your Help!

© 2018 SPLUNK INC.

 The source type automation relies on a library of keywords and punctuation  That library is stored in a CSV file in our open source Syslog Tools for Splunk App
https://gitlab.com/rationalcyber
 Please submit your samples! · If there's a unique keyword (or multiple unique keywords) in a given sourcetype's events, please
include it
· If there are no reliable keywords that distinguish a sourcetype, please submit common samples of
punct
· | tstats count where index=* sourcetype=example by punct | sort 10 - count · Please replace environment-specific portions of the punct, such as timestamp formatting driven
by your syslog server, with asterisks

How Should I Plan to Deploy All of This?
How to Use What You ve Learned Here Today

© 2018 SPLUNK INC.

Syslog

Build a new syslog server (VM preferred)

Deploy the syslog configs and cron jobs outlined here

Configure existing syslog servers to forward a copy of all data to this one

Deploy our syslog configs and newly generated inputs/
props to your production syslog
service

Install our Splunk app to a dev/test Splunk instance

Use our Catchall Cleanup
dashboard to help generate a new CSV as input to our build scripts

Install our Splunk app to your
production admin search head

Use our Catchall Cleanup
dashboard to identify new/ remaining catchall data sources

Did Catchall Cleanup identify the sourcetype?

Identify the sourcetype No manually and then send samples to
us!

Splunk

Our Configuration Build Scripts

Use our build scripts with an empty CSV to generate inputs/ props that send all syslog data to a catchall index

Build, deploy to the new syslog server, and test newly generated syslog inputs/
props confs

Generate an

updated CSV, fill in blanks (including

Yes

index), build/

deploy/test new

inputs/props confs

Daily/Weekly Maintenance

Previous Slide Summarized

© 2018 SPLUNK INC.

 Assume your syslog deployment has issues  It's easier to start over than to fix half a problem  Stand up a new syslog server using our syslog configs and forward it all the
logs from your existing syslog servers  Send all the logs to a catchall index and use our app to autogenerate clean new
configs with accurate sourcetypes and timezones  Deploy and test the clean configs  Rebuild/reconfigure all your Splunk syslog servers to act like the new one

© 2018 SPLUNK INC.
HEC/Kafka
Scaling your syslog intermediaries

To HEC (and Kafka?) With Syslog!

© 2018 SPLUNK INC.

 Last year, Mark Bonsack and Ryan Faircloth discussed coupling HEC to syslog for scalable aggregated data collection · "HEC" is HTTP Event Collection at the indexers · Primary use case dealt with improving the distribution of events across indexers · The standard script is at https://bitbucket.org/rfaircloth-splunk/rsyslog-omsplunk
 More recently, Splunk released Splunk Connect for Kafka on splunkbase · "Kafka" is the Apache project for building real-time data pipelines · Some folks are considering using Kafka stream processors to parse syslog and send it to
Splunk and elsewhere
· https://docs.splunk.com/Documentation/KafkaConnect/1.0.0/User/ConfigureSplunkKafkaConn
ect

© 2018 SPLUNK INC.
Simplify Syslog Configs and Scale at the Same Time
 The main issue we address is scaling the connection of syslog with other intermediary technologies in large Splunk environments · I.e., many types of syslog data from many hosts in multiple time zones need to end up in the
correct indexes with all the right metadata assigned
· Spawning hundreds of HEC python scripts or hundreds of Kafka topics may not be reasonable
(syslog-ng program() destination kicks off once)
 Solution: · Reuse the lessons we've discussed for syslog and forwarders!

© 2018 SPLUNK INC.
Best of Both Worlds for Syslog and Intermediary Streamers
 Keep the complexity out of syslog-ng.conf  Have syslog-ng pass the relevant metadata to the python glue script (json
FTW!)  Use the /event endpoint instead of /raw  Make the automation we've discussed more dynamic
· Python script maps event with its $HOST and $FACILITY metadata to sourcetype and
index; fixes timezone issues with $S_UNIXTIME offset
· Script behaves just like legacy omsplunkhec.py ("To HEC with syslog!") if no lookup exists for
mapping

© 2018 SPLUNK INC.
Syslog-ng Config for HEC/Kafka with Python Script
 destination d_program_json { program("/usr/local/bin/syslog2all.py <token> <server> \ --index=catchall \ --sourcetype=stash \ --lookup=/usr/local/bin/splunk_map.csv" template("$(format-json event=$MESSAGE \ host=$HOST \ host_from=$HOST_FROM \ facility=$FACILITY \ time=$S_UNIXTIME)\n") );
};

This is the most important line!

© 2018 SPLUNK INC.

template("$(format-json event=$MESSAGE host=$HOST host_from=$HOST_FROM facility=$FACILITY time=$S_UNIXTIME)\n")
 Does this metadata look familiar? · It's the same info we used to build our standardized directory tree for writing syslog to files
 format-json : Used to safely package the data for the python script  $HOST_FROM : "The host I received this feed from." It may be the same as the
originating host, or it may be an intermediate syslog server. In the latter case, helps with troubleshooting.  $HOST and $FACILITY : Used to lookup index and sourcetype  $S_UNIXTIME : Used, along with an offset, to set /event endpoint time attribute (timestamps are not parsed from the message text when using the /event endpoint!)

syslog2all.py

syslog-ng

program()
· $HOST · $FACILITY · $S_UNIXTIME · $MESSAGE

syslog2all.py

https
· host · index · sourcetype · time · event

previously
yes seen?
no

Lookup CSV

© 2018 SPLUNK INC.
HEC/ Kafka

How to Choose Your Collection Method

© 2018 SPLUNK INC.

My company is

I have tightly limited bandwidth
between syslog servers and indexers

I'm only collecting data from a single
time zone

I can't get my syslog load balanced across indexers even with autoLBFrequency=
5

already using Kafka to collect
logs, or we'd benefit from the pub/sub model for
other log consumers

I need to organize I have storage to

my syslog data into safely keep hours My syslog server is

tens or hundreds of or days of raw logs barely keeping up

indexes to enforce on my syslog

as it is

least privilege

servers

Yes

HEC or Kafka to an

Universal Forwarder, Forwarder, HEC, or

HEC, or Kafka

Kafka

HTTP load balancer with persistence

Forwarder or Kafka

turned off

Forwarder, or HEC/Kafka with
syslog4all.py

Forwarder

Forwarder, HEC, or (but really, enhance

Kafka

your server if you

can)

No

Heavy Forwarder, HEC, or Kafka

Forwarder, or HEC/Kafka with
syslog4all.py

Forwarder, HEC, or Forwarder, HEC, or Forwarder, HEC, or

Kafka

Kafka

Kafka

HEC or Kafka

Forwarder, HEC, or Kafka

 For most use cases, we still recommend the forwarder, but we love the work Mark Bonsack, Scott Haskell, and Ryan Faircloth are doing on HEC/Kafka

Thank you!

© 2018 SPLUNK INC.

 george@rationalcyber.com · Twitter: @RationalCyber · Slack usergroup: @chulobo
 Jonathan.Margulies@citadel.com · Twitter: @UnsaltedHash
 All of our open source projects, including all of our syslog resources: · https://gitlab.com/rationalcyber/

Want to learn more?
 HEC Yeah!! How Priceline Uses HEC to Ingest 4TB of Data Every Day · Wednesday, Oct 03, 4:30 p.m. - 5:15 p.m. · Mukund Murthy, Software Engineer, Priceline.com · Jagadeesh Motamarri, Senior Software Engineer, priceline.com LLC
 Old Meets New: Syslog and Splunk Connect for Kafka · Tuesday, Oct 02, 2:15 p.m. - 3:00 p.m. · Scott Haskell, Principal SE Architect, Splunk · Mark Bonsack, Staff Sales Engineer, Splunk
 Security Use Cases in Record Time With Splunk and Kafka · Wednesday, Oct 03, 3:15 p.m. - 4:00 p.m. · Nikolas Macroglou, Sales Engineer, Splunk · Lock Langdon, Global Director - Security Analytics at McKesson, McKesson

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
The Critical Tricks to Getting Syslog Into Splunk the Right Way
Don't forget to rate this session in the .conf18 mobile app

