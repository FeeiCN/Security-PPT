The  Evolu*on  of  Chrome  Security   Architecture
Huan  Ren   Chromium  Contributor   Qihoo  360  Technology  Ltd

Introduc*on  to  Speaker
· 2011.07  --  Present,    Qihoo  360  Technology  Ltd.   Engineering  lead  of  360  browser  team
· 2007  --  2011,  Staff  SoNware  Engineer,  Google  Inc             One  of  the  founding  engineers  of  Google  Chrome  
team
· 2004  --  2006,  SoNware  Design  Engineer           Windows  base  team,  MicrosoN

History
· Ini*al  version:  mul*--process,  no  sandbox   · 2007:  renderer  sandbox   · 2009:  extension  system   · 2010:  out  of  process  GPU   · 2010  and  ongoing:  plug--in  sandbox  and  
pepper

Today's  Chrome  Architecture

Browser

GPU

Sandbox  Policy

Renderer

Extension

Plug  In

Render  Sandbox
· Token  
Calling  CreateRestrictedToken  with  Null  SID  and  all   privileges  deleted.    
· Job  
JOB_OBJECT_LIMIT_ACTIVE_PROCESS   JOB_OBJECT_UILIMIT_READCLIPBOARD   ...  
· Alternate  desktop   · Low  integrity  level  (for  Vista+)  

Challenge:  compa*bility
· Two  phases  
­ Bootstrap:    ini*al  token   ­ Lockdown:  aNer  LowerToken()  is  called  
· API  Intercep*ons  

Broker  

(browser)

Policy   Engine  

IPC

Renderer

IPC

Policy   Intercep*ons Client

Intercep*ng  APIs  for  compa*bility,  not  for  sandboxing.

Challenge:  compa*bility
· Paint  to  screen

Browser cache

IPC  (shared   Renderer memory)
bitmap

WM_PAINT

Window

Render  Process  Separa*on
· Process  model  
­ Process  per  tab   ­ Process  per  site   ­ Process  per  site  instance     
· Mandatory  process  separa*on  
­ webUI,  extension,  and  normal  render  processes

Extension  Security  Architecture

Plug--in   (not     sandboxed)

Browser

Extension   host

Permissions Extension   (sandboxed   as  renderer)

Background   page

Message  passing

Renderer   ( sandboxed)

Content   script

JS  sandboxing

JS  sandbox:  isolated  world

Page DOM

V8   binding

Page  JS
Content   Script  1
Content   Script  2

Privilege  separa*on  
· Content  script:  running  in  renderer  process   associated  with  page  
· Extension  core:  running  in  separate  process   with  privilege  to  
­ issue  cross--origin  XMLHTTPRequest   ­ call  extensions  APIs   ­ load  plug--ins  
· Both  sandboxed  as  renderer  process.  

Message  passing
· One--*me  request  
chrome.extension.sendMessage   chrome.tabs.sendMessage   chrome.extension.onMessage.addListener  
· Long--lived  connec*ons  
chrome.extension.connect   chrome.extension.onConnect.addListener  
· Cross--extension  messaging  

Publishing
· Manifest  
{                     ...  
"key":  "publicKey",     "permissions":  [             "tabs",             "bookmarks",           "hjp://*.google.com/",           "unlimitedStorage"  ],   "plugins":  [...],   }  

Common  Extension  Vulnerabili*es
· Network  ajack           Use  <script  src>  with  an  HTTP  URL              · XSS           eval(),  innerHTML,  document.write()    
func*on  displayAddress(address)  {           eval("alert('"  +  address  +  "')");   }

Evalua*on  of  Chrome  Extensions
· Study  by  UC  Berkeley,  to  be  presented  in   upcoming  USENIX  Security  Symposium  2012  
­ Manual  review  of  50  popular  and  50  randomly-- selected  extensions.  
­ Found  70  vulnerabili*es  across  40  extensions.  
Source:  "An  Evalua*on  of  the  Google  Chrome  Extension   Security  Architecture"

Evalua*on  of  Chrome  Extensions

Vulnerable  Component Core  extension Content  script Website

Web  A1acker 5 3 6

Network  A1acker 50 1 14

Vulnerable   Component Core  extension Content  script Website Any

Popular
12 1 11 22

Random
15 2 6 18

Total
27 3 17 40

Source:  "An  Evalua*on  of  the  Google  Chrome  Extension  Security   Architecture"

Extension  Security  V2
· Support    Content--Security--Policy  (CSP)   · Manifest  V2           script-src 'self'; object-src 'self'
­ No  inline  script   ­ No  eval()   ­ Load  objects  only  from  within  package  or  whitelist  
· "prevent  96%  (49  out  of  51)  of  the  core   extension  vulnerabili*es  found.  "  

Other  Threats  on  Extensions
· Threat  model  
­ Ajack  on  core  extension  
· primary  design  goal  
­ Malicious  extensions  
· Chrome  sync  amplifies  the  threat  
­ Websites  that  have  been  altered  by  extensions  
· Remain  to  be  studied  
· Malicious  extensions  
­ From  Chrome  21,  only  allow  installa*on  from  web   store.  

GPU  Process

Shared  Memory

Browser   process

Renderer   process

Commands
Bitmaps   and  arrays

GPU   process

HWND
Child  HWND
H/w   decoder

GPU  Sandbox
· Token  
­ WinBuil*nUsersSid,             WinWorldSid,             WinRestrictedCodeSid  
· Connected  to  the  interac*ve  desktop

Plug--ins
· NPAPI  plug--ins  are  not  sandboxed  
­ Weakest  link  on  the  system  
· Mi*ga*ons  
­ Black  list   ­ Click  to  play   ­ Built  in  Flash  player  
· Fast  update   · Sandbox:  Vista  and  later,  low  integrity  mode  

Ppapi  Plug--ins

Browser   process

Plug--in   process

Cross  plazorm   System  APIs

Plug--in Ppapi

Locked  down   as  renderer     process

Renderer   process

Current  Progress
· Performance  improvement  
­ From  sync  layout  model  to  async  
· Conver*ng  na*ve  system  calls  to  ppapi  
­ Flash   ­ PDF  reader  
· Chrome  21  beta:  Ppapi  Flash  enabled  by   default  

Design  Principle  Review
· Least  privilege   · Privilege  separa*on   · Leveraging  system  security  mechanism   · Striking  a  balance  between  security  and  
performance,  user  experience.

