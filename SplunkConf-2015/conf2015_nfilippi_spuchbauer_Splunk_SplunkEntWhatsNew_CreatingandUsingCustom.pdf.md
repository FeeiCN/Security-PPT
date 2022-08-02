Copyright  ©  2015  Splunk  Inc.  
CreaEng  and  Using   Custom  Alert  AcEons  
Nicholas  Filippi  
Product  Management,  Splunk  
Siegfried  Puchbauer  
Client  Engineering,  Splunk  
  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aRer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

Who  We  Are  

Nicholas  Filippi     
Product  Management  
3  

Siegfried  Puchbauer     
Client  Engineering  

Agenda  
 Alert  AcEons  Framework  Overview    Demo    Live  Coding  ­  Build  alert  acEon  from  scratch  
4  

Make  machine  data  accessible,   usable  and  valuable  to  everyone.    
5  

Turning  Machine  Data  Into  Business  Value  

Index  untapped  data:  any  source,  type,  volume  

  Ask  any  ques=on  

On--   Premises  
Private     Cloud  
Public     Cloud  

Online   Services  

Web   Services  

Servers  

Security  

GPS   LocaEon  

Networks  

Packaged   ApplicaEons  

Storage  

Desktops  

Messaging  

Custom   ApplicaEons  

Online   Shopping  
Cart  

Telecoms  

RFID  

Databases  

Energy   Meters  

Web  

Call  Detail  

Clickstreams   Records  

Smartphones   and  Devices  

6  

Applica=on  Delivery  
IT  Opera=ons  
Security,  Compliance   and  Fraud  
Business  Analy=cs  
Industrial  Data  and   the  Internet  of  Things  

Turning  Machine  Data  Into  Business  Value  

Integrate  with  other  applica=ons  to  automate  workflows  and  improve  efficiencies  

TickeEng  Systems  

Webhook   Messaging  ApplicaEons  

Mobile  NoEficaEons  

Device  IntegraEon  

Monitor  ApplicaEons  
Custom   ApplicaEons  
SNMP  
7  

Applica=on  Delivery  
IT  Opera=ons  
Security,  Compliance   and  Fraud  
Business  Analy=cs  
Industrial  Data  and   the  Internet  of  Things  

Custom  Alert  AcEons  
Use  Splunk  Alerts  to  trigger  &  automate  workflows  
· Allows  packaged  integraEon  with     third--party  applicaEons    
· Simple  admin/user  configuraEon   · Developers  can  build,  package,  and  publish    
alert  acEon  extensions  for  naEve  integraEon     to  Splunk   · Growing  list  of  integraEons  available  
8  

Alert  AcEon  Examples  

· NoEficaEon  Services  
- Send  message  to  IM  clients  (HipChat,  Slack)   - Send  SMS  
· Incident  RemediaEon/TickeEng  
- Automate  the  creaEon  of  Eckets  (ServiceNow,  Jira)  
· IT  Monitoring  
- Send  incident/alert  into  monitoring  tools     (xMaeers,  BigPanda)  
· Security  
- Take  acEon  or  send  events  to  firewalls,  devices,   management  consoles  
· Internet--of--Things  
- Trigger  device--level  acEons  (change  lights,  sounds  an  alarm,   send  acEon  to  device)  
· Custom  AcEon  
- Trigger  any  organizaEon--specific  acEon  (restart  applicaEon,   integrate  with  homegrown  service,  and  more)  

Eco--system  Partners  

9  

Data  Source  

Real--World  Example  

Search  &  Trigger  

Alert  Ac=on  

Query:      index=main  sourcetype=load     |  stats  avg(load)  as  avg_load     |  search  avg_load  >  89  

Monitoring  mobile  accelerometer  data   during  keynote  presentaEon  

Use  Splunk  to  trigger  if  average  load   exceeds  threshold  of  89  
10  

Trigger  an  air  cannon  to  fire   Splunk  ponies  into  the  crowd      

Alert  AcEon  Framework  

 Packaging  

Package  and  distribute  custom  alert  acEons  within  apps  

 UI  Integra=on  

Build  UI  to  support  user  input  parameters  within  the  alert  workflow  

 Management  
 Permissions  
 Logging    Input  Valida=on    Dynamic  Parameter  Support    
(w/  token  subs=tu=on)  

Admin--level  management  to  enable/disable,  view  usage  stats,  and  more  
Access  controls  (configure  role--level  restricEons/permissions  to  access  these   alert  acEons)  
Logs  both  Splunkd  process  level  as  well  as  script--level  to  internal  index  
Perform  user  input  validaEon  on  save  of  a  given  alert   Define  parameters  to  be  passed  on  script  invocaEon;  available  token   subsEtuEon  for  1st  result  and  search/job/server  endpoints  

11  

Alert  AcEon  Framework  

 Mul=--PlaSorm  Compa=bility   Package  mulEple  scripts  to  run  based  on  plaoorm  type  (Windows,  Linux)  

 Secured  Storage  of   Creden=als  

Encrypt  sensiEve  credenEals  on  disk,  with  access  methods  to  read/write  from  your   alert  script  

 Ad--Hoc  Invoca=on  

Invoke  directly  from  query  string  or  workflow  acEons  for  tesEng  or  targeted  use  cases  

 Setup/Configura=on    Run=me  Arguments  
(Language  Agnos=c)  

Leverage  the  app  setup.xml  to  persist  global--level  script  parameters.    These   parameters  can  also  be  layered  with  invocaEon--specific  parameters  
Specify  runEme  parameters  (ex.,  java  interpreter  and  argument  flags)  
12  

Demo!  
13  

Alert  AcEon:  From  Scratch  

Resources  
Available  informa9on  relevant  for  developers  and  admins  
· Splunk  Docs  
- hep://docs.splunk.com/DocumentaEon/Splunk/6.3.0/ AdvancedDev/ModAlertsIntro    
- hep://docs.splunk.com/DocumentaEon/Splunk/6.3.0/ Alert/SetupalertacEons#Webhooks    
· Splunkbase  
- Partner  Apps  
Ø xMaeers,  BigPanda,  Twilio,  ServiceNow,  Octoblu  
- Internal  
Ø Hipchat,  Slack,  Hue  Bulbs  
· Developer  Guidance  
- Updated  chapter  on  alert  acEons   - Reference  implementaEon  ­  Atlassian  Jira  IntegraEon  
15  

Wrap--Up  
 Use  Splunk  Alerts  to  Automate  Workflows  &  Integrate  with  External  ApplicaEons  
- NoEficaEon/Messaging  Services,  Incident  RemediaEon  (TickeEng)  SoluEons,  IT  Monitoring  Tools,   Security  SoluEons,  Internet--of--Things  Devices,  and  Custom  ApplicaEons  
 Use  Custom  Alert  AcEons  via  the  "Add  AcEons"  scheduled  alert  menu    Manage  Alert  AcEons  via  "Sevngs  >  Alert  acEons"  page  
- Find  more  alert  acEons  to  install  via  "Browse  more"  
 Leverage  Docs/Examples/Developer--Guidance  to  Develop  a  Custom  Alert  AcEon  
16  

THANK  YOU  

Developer  Guide  

Build  a  New  Alert  AcEon  
Steps  
1. Alert  acEon  definiEon  (alert_acEons.conf)   2. Alert  acEon  script  (in  <app>/bin)   3. UI  for  configuring  the  alert  acEon  (HTML)   4. Spec  for  custom  parameters   5. OpEonally:  
­ Icon   ­ ValidaEon  rules   ­ App  setup  
19  

Example  Alert  AcEon  
· Atlassian  Hipchat  (Group  Chat)  
· API  v2  ­  Send  Room  NoEficaEons  
- heps://www.hipchat.com/docs/apiv2/method/send_room_noEficaEon  
· Custom  Alert  AcEon  ­  Includes:  
- App  setup  page  to  specify  Hipchat  server  URL  &  API  Token   - For  each  alert,  user  should  be  able  to  configure  
Ø Room   Ø Message   Ø Format  (plaintext,  html)   Ø Message  color   Ø NoEfy  users?  
20  

default/alert_ac=ons.conf   [hipchat]

RegistraEon  

is_custom = 1

label = HipChat description = Send HipChat room notifications icon_path = hipchat_alert_icon.png
payload_format = json

disabled = 0

param.base_url = https://api.hipchat.com/v2/ param.auth_token =

21  

Alert  Script  or  Binary  
· <app>/bin/<name>  
­ bin/hipchat.py  
· Carries  out  the  actual  alert  acEon  logic   · Receives  XML  or  JSON  payload  from  Splunk  when  invoked   · Supposed  to  be  short--lived  
­ Terminate  as  soon  as  acEon  has  been  executed  
· Python,  shell  scripts  or  binaries   · MulE--plaoorm/architecture  support     
22  

Execute  a  Custom  Command  
· ExecuEon  command/arguments  
­ Override  default  filename/path   ­ Specify  custom  interpreter   ­ Pass  args  
default/alert_ac=ons.conf   [myaction] ... alert.execute.cmd = java.path alert.execute.cmd.arg.0 = -jar alert.execute.cmd.arg.1 = $SPLUNK_HOME/etc/apps/myapp/bin/my.jar alert.execute.cmd.arg.2 = --execute
23  

MulE--Plaoorm  CompaEbility  
· Determines  the  alert  script  or  binary  to  execute  using     the  below  precedence  
  
-$SPLUNK_HOME/etc/apps/<app_name>/<arch>/bin    
Ø (arch  :  linux_x86_64,  darwin_x86_64,  windows_x86_64,  windows_x86)  
-$SPLUNK_HOME/etc/apps/<app_name>/bin     
24  

Script  InvocaEon  (Example)  

Splunk   (scheduler  ||  ad--hoc  invocaEon)  
sendalert  command  
gathers config; token replacement  
creates xml/json payload   determines script
location & runtime args   fire new process & pass
payload via STDIN   monitor STDERR  
process terminates  

{ "server_host": "localhost:8089", "server_uri": "https://localhost:8089", "session_key": "1234512345", "results_file": "/opt/splunk/var/run/splunk/12938718293123.121/results.csv.gz", "results_link": "http://splunk.server.local:8000/en-US/app/search?sid=12341234.123", "sid": "12341234.123", "search_name": "My Saved Search", "owner": "admin", "app": "search",
"configuration": { "room": "DevOps", "message": "Failed login attempts to wimpy:15000; user=`Jeff' and reason=`user-initiated'
and client_ip=`10.14.0.186'", "message_format": "plain", "base_url": "https://api.hipchat.com/v2/", "auth_token": "KJHJKHJGJHLKNJBLJBJBL"
}, "result": {
"sourcetype": "splunkd_access", "count": "24", "user": "Jeff", "client_ip": "10.14.0.186" } }

25  

Logging  
· Messages  printed  to  STDERR  are  logged  to  splunkd.log   · Direct  access  to  alert  acEon  logs  linked  from  "Alert  acEons"  manager  page  (via  "view  log  events")  
- Includes  both  (a)  splunkd  logs  for  alert  acEon,  and  (b)  alert--specific  log  
· Search  Query  
- index=_internal  sourcetype=splunkd  component=sendmodalert  acEon="<acEon_name>"  
26  

UI  IntegraEon  

default/data/ui/alerts/hipchat.html  

<!-- Defines UI to be rendered in the alert workflow (w/ data binding to savedsearch.conf params) -->

<form class="form-horizontal form-complex"> <div class="control-group"> <label class="control-label" for="hipchat_room">Room</label>

<div class="controls"> <input type="text" name="action.hipchat.param.room" id="hipchat_room" /> <span class="help-block">Enter the name of the HipChat room to send the notification to</span>
</div> </div> <div class="control-group">
<label class="control-label" for="hipchat_message">Message</label>

<div class="controls">

<textarea name="action.hipchat.param.message" id="hipchat_message"></textarea>

<span class="help-block">

Enter the chat message to send to the HipChat room.

The message can include tokens that insert text based on the results of the search.

<a href="{{SPLUNKWEB_URL_PREFIX}}/help?location=learnmore.alert.action.tokens"

target="_blank"

title="Splunk help">Learn More <i class="icon-external"></i></a>

</span>

</div> </div> ...

Note:  Currently,  we  only  support  sta9c  html  (filter  out  any  javascript).    Markup  should   follow  the  bootstrap  syntax  (hIp://getbootstrap.com/2.3.2/base--css.html#forms    

27  

Spec  Files  

README/alert_ac=ons.conf.spec  
# Defines parameters that to be added to the alert_actions.conf specification [hipchat]
param.base_url = <string> * HipChat API base URL - adjust if you're using you own server on premise
param.auth_token = <string> * HipChat OAuth2 token * see https://www.hipchat.com/docs/apiv2/ auth

README/savedsearches.conf.spec  
# Defines parameters that to be added to the savedsearches.conf specification # HipChat alert settings
action.hipchat = [0|1]
* Enable hipchat notification
action.hipchat.param.room = <string>
* Name of the room to send the notification to
action.hipchat.param.message = <string>
* The message to send to the hipchat room.
...

28  

Input  ValidaEon  
Available  via  restmap.conf  
[validation:savedsearch] action.webhook.param.url = validate( match('action.webhook.param.url',
"^https?://[^\s]+$"), "Webhook URL is invalid")
29  

Setup  &  ConfiguraEon  
· Available  via  app--level  setup.xml  
ê hep://docs.splunk.com/DocumentaEon/Splunk/6.3.0/AdvancedDev/SetupApp   ê hep://docs.splunk.com/DocumentaEon/Splunk/6.3.0/AdvancedDev/SetupXML  
· Linked  from  "Alert  acEons"  manager  page  
30  

Secure  Storage  of  CredenEals  
· Leverages  Splunk's  storage/passwords  endpoint  for  CRUD  operaEons  
ê hep://docs.splunk.com/DocumentaEon/Splunk/6.2.3/RESTREF/RESTaccess#storage.2Fpasswords    
· Note:  This  can  only  be  used  for  global--level  alert  acEon  sevngs  (not  per--alert)    
· Required  Steps:  
ê Add  entry  to  app.conf   ­ (ex.  "[credenEal::hipchat_api_token:]")  
ê Update  setup.xml  to  write  to  storage/passwords  endpoint  
­ (ex.  `<input  endpoint="storage/passwords"  enEty=":hipchat_api_token:"  field="password">')  
ê Update  script  to  get  secure  credenEals  from  splunkd  endpoint  
default/bin/hipchat.py  
... def get_api_key(payload):
url_tpl = '%s/servicesNS/nobody/hipchat_alerts/storage/passwords/%%3Ahipchat_api_token%%3A?output_mode=json' req = urllib2.Request(url_tpl % payload.get('server_uri'), None,
{'Authorization': 'Splunk %s' % payload.get('session_key')}) res = urllib2.urlopen(req) body = json.loads(res.read()) return body['entry'][0]['content']['clear_password'] ...
31  

Access  Control  
· Packaged  alerts  acEons  should  set  to  global  
ê Via  metadata/default.meta
[alert_actions/hipchat] export = system
· Enable  role--level  permissions  via  "Alert  acEons"  manager  page  
32  

Packaging  
· App  can  package  more  than  1   alert  acEon  
· Packaged  files  support  
- RegistraEon  as  an  alert  acEon   - Script  itself   - UI  IntegraEon   - Configuring  alert/search  parameters   - Permissions  (exporEng  to  global)   - Default  param  values   - Etc.  
33  

THANK  YOU  

