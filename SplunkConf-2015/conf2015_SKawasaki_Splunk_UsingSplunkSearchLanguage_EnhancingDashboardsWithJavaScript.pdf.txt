Copyright  ©  2015  Splunk  Inc.  
Enhancing  Dashboards   with  JavaScript!  
Satoshi  Kawasaki  
Consultant,  Splunk  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aPer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

Who  Am  I?  
Satoshi  Kawasaki  (hobbes3)  
I'm  a  Ramblin'  Wreck  from  Georgia  Tech,   and  a  hell  of  an  engineer--  (Aerospace)      but  now  I'm  a  consultant  at  Splunk  aPer   some  dabbles  in  web  development.  
3  

The  Strategy  
 ExpectaGons    Why  JavaScript?    Simple  XML    Tools  +  Tips    Common  Use  Cases  #1--#8    References  
4  

ExpectaGons  
 I  can't  teach  you  JavaScript  (for  free)    You  need  to  learn/explore  on  your  own  (or  hire  someone  else)    LMGTFY    I  don't  support  older  Splunk  versions  (unless  I'm  paid)    These  slides  (by  itself)  are  terrible    I  will  go  FAST  but  you  can  always  replay  the  recording  at  0.5x    This  talk  will  probably  only  cover  1%  of  what  SplunkJS  and  
Javascript  SDK  can  do  
5  

Why  JavaScript?  
 You're  not  limited  to  Simple  XML    Client--side  programming    It's  magic  (to  end  users)!    It  makes  bosses  and  execuGves  happy!  
6  

Simple  XML  
 You  may  not  need  JavaScript!    Simple  XML  is  geing  more  robust  
with  every  6.x  release    Avoid  JavaScript  if  possible  (unless  
you  want  job  security)    You  can  even  declare  custom  
visualizaGons  in  only  Simple  XML!  

<drilldown>   <selection>   <condition>   <change>   <chart  depends="$foo$">   <set  token="form.foo">   <unset  token="cat">   <eval  token="foo">  

7  

Tools  +  Tip  
 Chrome/Web  Developer  Tool    Browser  +  Server  caching    Dev  Splunk  instance  (restarts)  
web.conf     
[settings]   cacheEntriesLimit  =  0   minify_js  =  False   minify_css  =  False  
8  

Be  the  Explorer!  
And  read  the  docs...  especially  example  code!  
9  

Use  Case  #1:  "Hello  World"  
<form  script="their_app:their_script.js,  foo.js">     alert("hello  world!");  
Put  in  $SPLUNK_HOME/etc/apps/<my_app>/appserver/static/   Requires  a  splunkweb  restart  to  be  read  for  the  first  Gme  
10  

Use  Case  #2:  RequireJS  
require([           "jquery",           "underscore",           "splunkjs/mvc",           "app/my_app/my_include",           "splunkjs/mvc/simplexml/ready!"   ],  function(           $,           _,           mvc,           my_include   )  {           require(["splunkjs/ready!"],  function()  {                   //  foo           });   });  
RequireJS  is  hard...  (there,  I  said  it)  
11  

Use  Case  #3:  IDs  
<chart  id="my_chart">   <input  type="text"  token="foo"  id="my_input">   <row  id="my_row">   <search  id="my_search">  
mvc.Components.get("my_chart");   mvc.Components.get("my_search").settings.get("search");   $("#my_chart").slideDown();  
Avoid  this:  
mvc.Components.get("element3");   $("#input23");  
12  

Use  Case  #4:  Understanding  $tokens$  

 URL  tokens    form  tokens    default/unsubmised  tokens    submised  tokens  

.../app/my_app/my_dashboard?earliest=--24h%40h&latest=now&form.foo=bar   <input  type="text"  token="foo">   var  unsubmitted_tokens  =  mvc.Components.get("default");   var  submitted_tokens  =  mvc.Components.get("submitted");  

Import  "simple_xml_examples:showtokens.js"  to  understand  the  token  madness!  

13  

Use  Case  #4  cont'd:  ManipulaGng  $tokens$  
function  submit_and_update_url()  {           submitted_tokens.set(unsubmitted_tokens.toJSON());           mvc.Components.get("url").saveOnlyWithPrefix("form\\.",  unsubmitted_tokens.toJSON(),  {                   replaceState:  false           });   }  
Se1ng  and  unse1ng  tokens:  
unsubmitted_tokens.set("form.foo",  "bar");   unsubmitted_tokens.unset("form.apple");   submit_and_update_url();  
Listening  to  token  changes:  
submitted_tokens.on("change:foo",  function()  {           //  foo   });  
14  

WARNING!  
15  

Use  Case  #5:  Searches  and  Jobs  
Create  a  basic  oneshot  search:  
var  service  =  mvc.createService();      var  search  =  "search  index=_*  |  stats  count  by  index  sourcetype";   var  search_params  =  {           earliest_time:  "--5m@m",           latest_time:  "now",           count:  50   };      service.oneshotSearch(search,  search_params,  function(err,  results)  {           var  fields  =  results.fields;           var  rows  =  results.rows;           var  sourcetype  =  results.row[0][fields.indexOf("sourcetype")];   });  
SoP  limit  of  100  rows;  a  hard  limit  of  50,000  rows!   If  you  need  to  retrieve  a  large  data  set,  then  use  count+offset  and  "sGtch"  it  back  together  (LMGTFY)  
16  

Use  Case  #5  Cont'd:  Searches  and  Jobs  
When  a  search  completes:  
var  my_search  =  mvc.Components.get("my_search");      my_search.on("search:done",  function(properties)  {           console.log("DONE!\nSearch  job  properties:",  properties.content);   });     
Accessing  the  results  of  a  search:  
var  my_results  =  my_search.data("results",  {count:  20});      my_results.on("data",  function()  {           var  rows  =  this.data().rows;   });  
17  

Use  Case  #6:  Listeners  
<opGon  name="drilldown">all</opGon>  
var  my_timechart  =  mvc.Components.get("my_timechart");      my_timechart.on("click",  function(e)  {           e.preventDefault();   });     
Also  there  are:  
· "selection"   · "click:chart"   · "click:legend"   · "click:marker"  
18  

Use  Case  #7:  Render  IntercepGons  

require([           "jquery",  

$SPLUNK_HOME/share/splunk/search_mrsparkle/exposed/js/splunkjs/mvc  

        "splunkjs/mvc",  

        "splunkjs/mvc/tableview",  

        "splunkjs/mvc/simplexml/ready!"  

],  function($,  mvc,  TableView)  {  

        var  MyTableRenderer  =  TableView.BaseCellRenderer.extend({  

                canRender:  function(cell)  {  return  cell.field  ===  "foo";  },  

                render:  function($td,  cell)  {  

                        var  field  =  cell.field;  

                        var  value  =  cell.value;                           $td.text(value  +  "!");  

Check  more  table  examples  at    

                }  

        });  

  

        mvc.Components.get('my_table').getVisualization(function(tableView)  {  

                tableView.table.addCellRenderer(new  MyTableRenderer());  

                tableView.table.render();  

        });  

19  

Use  Case  #8:  More  JavaScript  SDK  
Get  the  current  user:  
service.currentUser(function(err,  user)  {           console.log("Current  user:  ",  user.properties().realname,  "  ("  +  user.name  +  ")");   });  
 Can  do  a  lot  of  (dangerous)  tasks    Manage  configuraGons  and  objects  (ie  delete  
and  modify  objects)    Log  in    Integrate  Splunk  results  to  your  own  
applicaGon  
20  

References  
JavaScript  SDK  +  Reference   SplunkJS  +  Reference   Simple  XML   Splunk  6.x  Dashboard  Examples   Custom  VisualizaGons    Unofficial:  My  code  snippets  
21  

Rachel  Perkins   Chris  Breshears      GenG  Zaimi   Thomas  Mann   Roy  Moranz   Misty  Gibbs  

Itay  Neeman   David  Foster   Siegfried  Puchbauer     Mathew  ElGng   Nick  Filippi   Michael  Porath   Sanford  Owings   Vladimir  Skyork   Alexander  Johnson   Stephen  Sorkin   Tom  LaGasa  

THANK  YOU  

