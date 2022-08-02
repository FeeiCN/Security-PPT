Copyright  ©  2015  Splunk  Inc.  
Using  Web  Logs  in  Splunk  to  Dynamically   Create  Synthe:c  Transac:on  Tests  
Jus:n  Brown  
IT  Engineer   Pacific  Northwest  Na:onal  Laboratory  

Disclaimer  
During  the  course  of  this  presenta:on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau:on  you  that  such  statements  reflect  our   current  expecta:ons  and  es:mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta:on  are  being  made  as  of  the  :me  and  date  of  its  live   presenta:on.  If  reviewed  aSer  its  live  presenta:on,  this  presenta:on  may  not  contain  current  or   accurate  informa:on.  We  do  not  assume  any  obliga:on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi:on,  any  informa:on  about  our  roadmap  outlines  our  general  product  direc:on  and  is  subject  to   change  at  any  :me  without  no:ce.  It  is  for  informa:onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga:on  either  to  develop  the  features  
or  func:onality  described  or  to  include  any  such  feature  or  func:onality  in  a  future  release.  

Agenda  
!  Introduc:on  to  Selenium  and  exis:ng  Splunk  app   !  Demo  of  data  collected   !  Building  manual  tests  in  Python   !  Problems  with  the  manual  method   !  Building  dynamic  tests  using  Splunk  data   !  Aler:ng  on  issues   !  Ideas  for  expanding     

Selenium  Tes:ng  

Introduc:on  to  Selenium  
!  Selenium  ­  Web  Browser  Automa:on  
­ hWp://www.seleniumhq.org     
!  Python  API  for  Selenium  WebDriver  
­ hWp://selenium--python.readthedocs.org  

Splunk  Synthe:c  App  
!  Splunk  App  for  Synthe:c  Transac:on  Monitoring  
­ hWp://apps.splunk.com/app/1880   ­ By:  Elias  Haddad  
!  Setup  
­ Install  Python  if  using  Universal  Forwarder   ­ Install  selenium  and  user--agents  modules  for  Python  

Basic  Webdriver  Demo  
7  

What  Data  Can  We  Get?  

Sample  Data  
2015--07--17  10:16:12  app_name="External  Sites"  transac:on_name="www.google.com"   event_type="end"  transac:on_end="2015--07--17  10:16:12"   transac:on_end_epoch="1439831772.32"  execu:on_id="a30fd38f--4503--11e5-- a699--0050568542ad"  transac:on_dura:on="1.56299996376"  browser="Firefox"   browser_version="40"  os="Windows  7"  os_version=""  ip="173.194.123.72"  
   2015--07--17  10:16:02  app_name="External  Sites"  transac:on_name="www.google.com"   event_type="start"  transac:on_start="2015--07--17  10:16:02"   transac:on_start_epoch="1439831762.76"  execu:on_id="a30fd38f--4503--11e5-- a699--0050568542ad"  browser="Firefox"  browser_version="40"  os="Windows  7"   os_version=""  ip="173.194.123.72"  

Extracted  Fields  

! app_name   ! transac:on_name   ! event_type   ! transac:on_start/end   ! Execu:on_id   ! Transac:on_dura:on   ! Ip   !  Browser  

! Browser_version   ! Os   ! Os_version  
   !  min/max/avg_latency   ! Packet_loss  

App  Visualiza:on  
11  

Building  Tests  in  Python  

  Example  Manual  Test  
from  selenium  import  webdriver   from  selenium.webdriver.common.by  import  By   from  selenium.webdriver.common.keys  import  Keys   from  selenium.webdriver.support.ui  import  Select   from  selenium.common.excep:ons  import  NoSuchElementExcep:on   import  uniWest,  :me,  re   ######  STEP  1   ###  Include  the  splunktransac:ons  module  in  your  script   from  splunktransac:ons  import  Transac:on        class  GoogleTest(uniWest.TestCase):           def  setUp(self):                   self.driver  =  webdriver.Firefox()                        #  replace  the  above  line  with  the  below  line  to  run  as  Safari                   #  Safari  driver  needs  to  be  downloaded                   #self.driver  =  webdriver.Safari()  

  Set  the  URL  
class  GoogleTest(uniWest.TestCase):           def  setUp(self):                   self.driver  =  webdriver.Firefox()                        #  replace  the  above  line  with  the  below  line  to  run  as  Safari                   #  Safari  driver  needs  to  be  downloaded                   #self.driver  =  webdriver.Safari()                   self.driver.implicitly_wait(30)                   self.base_url  =  "hWps://www.google.com/"                   self.verifica:onErrors  =  []                   self.accept_next_alert  =  True                      def  test_google(self):                   driver  =  self.driver                        ######  STEP  2                   ###  Provide  a  name  to  your  Applica:on  eg.  'Google'  

  Name  your  App  and  Transac:on  
                ######  STEP  2                   ###  Provide  a  name  to  your  Applica:on  eg.  'Google'                   a=Transac:on(driver,  'Google')                        ######  STEP  3                   ###  assign  a  name  to  the  transac:on  by  defining  a  start  and  an  end                     a.Transac:onStart(driver,  'Google  Home  Page')                   driver.get(self.base_url  +  "/")                   #:me.sleep(1)                   a.Transac:onEnd(driver,  'Google  Home  Page')                   :me.sleep(4)                                      ######  STEP  4                   ###  Repeat  Step  3  and  4  as  needed  for  as  many  transac:ons  as  needed                   a.Transac:onStart(driver,  'Search  Splunk')                   driver.find_element_by_id("gbqfq").clear()                   driver.find_element_by_id("gbqfq").send_keys("splunk")  

  Adding  Other  Tests  
                                   ######  STEP  4                   ###  Repeat  Step  3  and  4  as  needed  for  as  many  transac:ons  as  needed                   a.Transac:onStart(driver,  'Search  Splunk')                   driver.find_element_by_id("gbqfq").clear()                   driver.find_element_by_id("gbqfq").send_keys("splunk")                   driver.find_element_by_id("gbqu").click()                   :me.sleep(1)                   driver.find_element_by_xpath("//a[@id='vs0p1']/b[2]").click()                   a.Transac:onEnd(driver,  'Search  Splunk')                   :me.sleep(2)                      def  tearDown(self):                   self.driver.quit()                   self.assertEqual([],  self.verifica:onErrors)        if  __name__  ==  "__main__":  

Problems  With  The   Manual  Method  

Problems  We  Encountered  
!  Two  events  per  test  
­ Forced  to  use  TRANSACTION  command   ­ False  posi:ves  in  app   ­ False  alerts  when  service  restarted  on  indexers  
!  Missing  data  
­ No  server  info   ­ No  context  for  failures  
!  Manually  building  tests  is  slow  
­ Slow  to  build   ­ Difficult  to  maintain  

Building  Dynamic  Tests  

Goals  
!  Single  event  per  test  
!  Capture  error  informa:on  
!  Build  tests  dynamically  given  an  array  of  info  
­ URL   ­ App  Name   ­ Transac:on  Name   ­ Expected  :tle   ­ Server  

Single  Event  Per  Test  
!  Modified  splunktransac+ons.py  
­ Added  Passed  /  Warning  /  Failed  status   ­ Added  error  info   ­ Added  server  info   ­ Combined  data  into  one  event  
   2015--08--17  11:30:47  app_name="Google"  transac:on_name="Home  Page"  result=Passed   dura:on=1.63  browser="Firefox"  browser_version="39"  os="Mac  OS  X"   os_version="10.10"  ip="173.194.123.72"  server="unknown"  

Capturing  Failed  Test  Info  
!  Failure  types  
­ Server  responds:    Error  on  page  (404,  500,  etc)   ­ Server  doesn't  respond:    Problem  loading  page   ­ Timeout  issues  (  >  30  seconds  to  load)  
ê Check  for  login  prompt   ­ Unknown  

Tes:ng  for  Errors  
!  Tes:ng  for  400  and  500  errors  
­ self.assertNotRegexpMatches(page_:tle,  r'[4,5]\d\d',  '1')     
!  Tes:ng  for  no  page  loaded   ­ self.assertNotRegexpMatches(page_:tle,  r'problem|not\savailable|error',  '2')     
!  Tes:ng  for  a  specific  :tle  
­ self.assertIn(:tle,  self.driver.:tle,  '3')  

Try  /  Except  

def  test(self):  

                a=Transac:on(self.driver,  `Google')                   a.Transac:onInfo(`Google  Home  Page')  

                try:  

                            self.driver.get(`hWps://www.google.com')  

                            page_:tle  =  self.driver.:tle.lower()  

                            self.assertNotRegexpMatches(page_:tle,  r'[4,5]\d\d')                               self.assertNotRegexpMatches(page_:tle,  r'problem|not\savailable|error')  

                            self.assertIn(`Google  Home  Page',  self.driver.:tle)  

                            a.Transac:onPass()  

                except  Asser:onError  as  error:  

                            #  Warn  on  401  or  403  errors                               try:  

                                          self.assertNotRegexpMatches(page_:tle_lc,  r'40[1,3]')  

                                          a.Transac:onFail(page_:tle)                               except  Asser:onError  as  error:  

                                          a.Transac:onWarn(page_:tle)                               except  TimeoutExcep:on:  

                                          error  =  'Timeout:  Page  did  not  load  within  30  seconds'  

                                          try:                                                           alert  =  False  

                                                        while  True:                                                                         Alert(self.driver).dismiss()  

                                        alert  =  True  

                                          except  NoAlertPresentExcep:on:                                                           a.Transac:onFinish()  

                                                        if  alert  ==  True:                                                                         a.Transac:onWarn('Test  account  denied  access')  

                                                        else:  

                                                                      a.Transac:onFail(error)                                   except:  

                                              a.Transac:onFinish()  

                                              error  =  'An  unknown  error  occured:  %s'  %  page_:tle

  

        

                                              a.Transac:onFail(error)  

                                              raise                 finally:  

                            a.Transac:onOutput()  

Build  Tests  Dynamically  
Set  up  the  array  
#  Array  of  arrays:  app_name,  transac:on_name,  url,  :tle   tests  =  [           ['Google','Google  Home  Page','hWps://www.google.com','Google'],           ['Yahoo','Yahoo  Home  Page','hWps://www.yahoo.com','Yahoo'],           ['Bing','Bing  Home  Page','hWps://www.bing.com','Bing']   ]  

Build  Tests  Dynamically  

def  test_generator(app_name,transac+on_name,url,+tle):           def  test(self):  

Create  "Test  Builder"  Func:on  

                a=Transac:on(self.driver,  app_name)  

                a.Transac:onInfo(transac:on_name)  

                try:  

                            self.driver.get(url)  

                            page_:tle  =  self.driver.:tle.lower()  

                            self.assertNotRegexpMatches(page_:tle,  r'[4,5]\d\d')  

                            self.assertNotRegexpMatches(page_:tle,  r'problem|not\savailable|error')  

                            if  :tle  !=  None:  

                                          self.assertIn(:tle.lower(),  page_:tle_lc)  

                            a.Transac:onPass()  

              except  Asser:onError  as  error:  

                            #  Warn  on  401  or  403  errors  

                            try:  

                                          self.assertNotRegexpMatches(page_:tle_lc,  r'40[1,3]')  

                                          a.Transac:onFail(page_:tle)  

                            except  Asser:onError  as  error:  

                                          a.Transac:onWarn(page_:tle)  

                            except  TimeoutExcep:on:  

                                          error  =  'Timeout:  Page  did  not  load  within  30  seconds'  

                                          try:  

                                                        alert  =  False  

                                                        while  True:  

                                                                      Alert(self.driver).dismiss()  

                                        alert  =  True  

                                          except  NoAlertPresentExcep:on:  

                                                        a.Transac:onFinish()  

                                                        if  alert  ==  True:  

                                                                      a.Transac:onWarn('Test  account  denied  access')  

                                                        else:  

                                                                      a.Transac:onFail(error)  

                                except:  

                                              a.Transac:onFinish()  

                                              error  =  'An  unknown  error  occured:  %s'  %  page_:tle

  

        

                                              a.Transac:onFail(error)  

                                              raise  

              finally:  

                            a.Transac:onOutput()  

  

return  test  

Build  Tests  Dynamically  
Add  each  test  to  the  Unit  Test  suite  
count  =  0        #  Build  tests  from  test  array   for  test  in  tests:                   count  =  count  +  1                   test_name  =  'test_%03d'  %  count                   test_case  =  test_generator(test[0],test[1],test[2],test[3])                   setaWr(DynamicTests,  test_name,  test_case)  

Building  Dynamic  Tests   Using  Splunk  Data  

Build  Splunk  User  &  Report  
!  Create  a  user  in  Splunk  with  minimal  privileges   !  Create  a  report  with  that  user  
­ IIS  Logs   ­ Top  sites  by  unique  users  over  7  days  
index=   iis  cs_method=GET  sc_status=200   |  stats  dc(c_ip)  as  count,  min(s_port)  as  port,  min(s_ip)  as  s_ip  by  cs_host,  s_computername     |  sort  --  count     |  eval  server  =  upper(s_computername)     |  eval  category  =  <insert  magic  here>   |  table  category,  cs_host,  url,  server,  s_ip  

Accessing  Report  in  Python  
!  Get  the  splunklib  module  for  Python:  hWp://dev.splunk.com/python  
  
import  splunklib.client  as  client   import  splunklib.results  as  results      def  splunksearch(offset=0,  limit=0):           HOST  =  "localhost"           PORT  =  8089           USERNAME  =  "splunk_user"           PASSWORD  =  "changeme"              service  =  client.connect(host=HOST,  port=PORT,  username=USERNAME,  password=PASSWORD,  owner="splunk_user",  app="splunk--app--synthe:c")              savedsearch  =  service.saved_searches["SWT_top_sites_by_users"]              history  =  savedsearch.history()           search_kwargs  =  {                   "offset":      offset,                   "count":        limit           }           searchresults  =  results.ResultsReader(history[0].results(**search_kwargs))              return  searchresults  
30  

Aler:ng  on  Issues    

Things  to  Alert  On  
!  Synthe:c  Transac:ons  have  stopped   !  Test  failures  on  individual  websites  

One  Query  for  All  Sites  

transac+on_name   failure_kpi   to  

cc  

Bcc  

Google  Home  Page   4  

admin@google.com  

index=web  sourcetype=synthe:c:transac:on   |  transac:on  transac:on_name  endswith=result!="Failed"  keepevicted=true   |  search  result=failed  eventcount>1   |  lookup  alert_subscrip:ons  transac:on_name  output  failure_kpi,to,cc,bcc   |  fillnull  value=2  failure_kpi   |  eval  Status  =  if(mvindex(result,--1)="Failed","DOWN","Service  Restored")   |  search  Status=DOWN  OR  (Status="Service  Restored"  AND  eventcount>2)   |  eval  Down:me  =  tostring(dura:on,  "dura:on")   |  fillnull  value="jus:n@pnnl.gov,  arzu.gosney@pnnl.gov"  to   |  eval  failures  =  if(Status="DOWN",  eventcount,  eventcount--1)   |  where  failures  >=  failure_kpi  AND  _:me  +  dura:on  >  rela:ve_:me(now(),  "--1h")   |  rename  transac:on_name  as  Site   |  eval  link  =  replace(Site,  "  ",  "%20")   |  eval  eventstart  =  strSime(_:me,"%m/%d/%Y  --  %I:%M:%S  %p")   |  eval  UniqueId  =  _:me  +  Status   |  eval  eventend  =  strSime(_:me  +  dura:on,  "%m/%d/%Y  --  %I:%M:%S  %p")   |  eval  details  =  if(event_type  ==  "end",  "Service  Restored:  "  .  eventend,  "Last  Failure:  "  .  eventend)   |  table  server,  Site,  Status,  eventstart,  Down:me,  failures,  UniqueId,  failure_kpi,  to,  cc,  bcc,  link,  details,  error  

33  

Configuring  the  Alert  
34  

Ideas  For  Expanding    

Future  Plans  
!  User  interface  in  app  for:  
­ Subscribing  to  alerts   ­ Adding  sites  to  manual  list   ­ "Blacklis:ng"  sites  
  
!  Combine  test  failures  inline  with  IIS  logs  

THANK  YOU!  
Jus:n  Brown  
jus:n@pnnl.gov   @theOtherJus:nB  

