My Bro The ELK
Obtaining Security Context from Security Events
Travis Smith
tsmith@tripwire.com

Agenda
· What is the problem? · Who is the Bro? · What is an ELK? · Beefing up the ELK · Making Your Bro the ELK Intelligent · Visualization w/ Kibana · Introducing the TARDIS framework

conn.log dhcp.log dnp3.log dns.log ftp.log http.log irc.log known_services.log modbus.log ius.log smtp.log snmp.log ssh.log ssl.log syslog.log tunnel.log intel.log notice.log

INPUTS FILE

TCP/UDP

STDIN

40+ More

FILTERS GROK

GEOIP

TRANSLATE

TRANSLATE

30+ More

OUTPUTS ElasticSearch

Syslog

Email

STDOUT

50+ More

INPUTS FILE

TCP/UDP

STDIN

40+ More

FILTERS GROK

GEOIP

TRANSLATE

TRANSLATE

30+ More

OUTPUTS ElasticSearch

Syslog

Email

STDOUT

50+ More

Threat Intelligence Made Easy

Critical Stack Agent

98 Threat Feeds

800,000+ Indicators

Logstash Filtering
· Utilizing Custom Patterns · GROK Message Filtering · Adding Custom Fields · Adding Geo IP Data · Date Match · Using Translations for Threat Intel

Logstash Configuration
filter { grok { match => { "message" => "%{IP:client} %{WORD:method} %{URIPATHPARAM:request}
%{NUMBER:bytes} %{NUMBER:duration}" }
} }

Utilize Custom Patterns
filter { grok { patterns_dir => "/opt/logstash/custom_patterns" match => { message => "%{291001}" } }
}
/opt/logstash/custom_patterns/bro.rule 291001 (?<start_time>\d{10}\.\d{6})\t(?<evt_srcip>[\d\.]+)\t(?<evt_dstip>[\d\.]+)\t(?<evt_srcport>\d+)\t...

Message Filtering

filter { if [message] =~ /^((\d{10}\.\d{6})\t([\d\.]+)([\d\.]+)\t(\d+)\t(\d+)\t(\w+))/ { grok { patterns_dir => "/opt/logstash/custom_patterns" match => { message => "%{291001}" } } }
}

Remove Capture Groups

291001 (?<start_time>\d{10}\.\d{6})\t(?<evt_srcip>[\d\.]+)\t(?<evt_dstip>[\d\.]+)\t(?<evt_srcport>\d+)\t...

Add Custom Fields
filter { if [message] =~ /^((\d{10}\.\d{6})\t([\d\.]+)([\d\.]+)\t(\d+)\t(\d+)\t(\w+))/ { grok { patterns_dir => "/opt/logstash/custom_patterns" match => { message => "%{291001}" } add_field => [ "rule_id", "291001" ] add_field => [ "Device Type", "IPSIDSDevice" ] add_field => [ "Object", "NetworkTraffic" ] add_field => [ "Action", "General" ] add_field => [ "Status", "Informational" ] } }
}

Geo IP

filter {

.....all normalization code above here.... geoip {

New ElasticSearch Template Needed

source => "evt_dstip"

target => "geoip_dst"

database => "/etc/logstash/conf.d/GeoLiteCity.dat"

add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][longitude]}" ]

add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][latitude]}" ]

add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][city\_name]}" ]

add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][continent\_code]}" ] add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][country\_name]}" ]

add_field => [ "[geoip_dst][coordinates]", "%{[geoip_dst][postal\_code]}" ]}

mutate {

convert => [ "[geoip_dst][coordinates]", "float"]

}

}

GeoIP Template Update

curl -XGET localhost:9200/_template/logstash {"logstash":{
"order":0, "template":"logstash-*", "settings":{
"index.refresh_interval":"5s" }, "mappings":{
"properties":{ "geoip":{ "dynamic":true, "properties":{ "location":{ "type":"geo_point" } }, "type":"object" }, ...

{"logstash":{ "order":0, "template":"logstash-*", "settings":{ "index.refresh_interval":"5s" }, "mappings":{ "properties":{ "geoip_dst":{ "dynamic":true, "properties":{ "location":{ "type":"geo_point" } }, "type":"object" }, ...
curl -XPUT localhost:9200/_template/logstash -d `....'

Date Match
filter { ....all normalization code above here.... ....all GeoIP code here.... date { match => [ "start_time", "UNIX" ] }
}

Threat Intel

filter { ....all normalization code above here.... ....all GeoIP code here.... translate { field => "evt_dstip" destination => "tor_exit_IP" dictionary_path => '/etc/logstash/conf.d/torexit.yaml' }
}

torexil.yaml
"162.247.72.201": "YES" "24.187.20.8": "YES" "193.34.117.51": "YES"

· Run Scripts to update the YAML files on a regular basis · Logstash will check the YAML for updates every 300 seconds
­ Configurable by adding refresh_interval => numSeconds

Custom Fields: "Device Type" => "IPSIDSDevice" "Object" => "HTTP" "Action" => "General" "Status" => "Informational"
Threat Intel Translations: "tor_exit_IP" => "YES" "malicious_IP" => "YES"
Geo IP Data: "country_code2" => "RU" "country_code3" => "RUS" "country_name" => "Russian Federation" "continent_code" => "EU" "city_name" => "Moscow" "postal_code" => "121087" "latitude" => 55.75219999999999 "longitude" => 37.6156 "timezone" => "Europe/Moscow"

The TARDIS Framework
· Threat Analysis, Reconnaissance, & Data Intelligence System
· Historical exploit/IOC detection · Time Lord of forensic log data · Available at https://github.com/tripwire/tardis · Demo at Arsenal Thursday @ 12:45

10.10.10.10 - - [06/Aug/2015:05:00:38 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd" 10.10.10.10 - - [06/Aug/2015:05:00:39 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd" 10.10.10.10 - - [06/Aug/2015:05:00:40 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd" 10.10.10.10 - - [06/Aug/2015:05:00:41 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd" 10.10.10.10 - - [06/Aug/2015:05:00:42 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd" 10.10.10.10 - - [06/Aug/2015:05:00:43 -0400] "GET /cgi-bin/test.cgi HTTP/1.1" 200 525 "-" "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /etc/passwd"

Sound Bytes
· Use NSM With Log · Security Tools Are Better With Intelligence · Take Integrations to the Next Level With TARDIS

Thank You
Travis Smith tsmith@tripwire.com
https://github.com/Tripwire/tardis https://github.com/TravisFSmith/MyBroElk

