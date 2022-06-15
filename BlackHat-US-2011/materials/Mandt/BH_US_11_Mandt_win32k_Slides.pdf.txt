Kernel  A(acks  through  User-- Mode  Callbacks  
Tarjei  Mandt   Black  Hat  USA  2011  

Who  am  I  

· Security  Researcher  at  Norman  
· Malware  Detec3on  Team  (MDT)  
· Interests  
· Vulnerability  research   · Opera3ng  system  internals  
· Past  Work  
· Kernel  Pool  Exploita3on  on  Windows  7   · Mi3ga3ng  NULL  Pointer  Exploita3on  on  Windows  

July  27,  2011  

About  this  Talk  
July  27,  2011  
· Several  vulnerability  classes  related  to  windows   hooks  and  user--mode  callbacks  
· Null  pointer  dereferences   · Use--aMer--frees  
· Resulted  in  44  patched  privilege  escalaLon   vulnerabiliLes  in  MS11--034  and  MS11--054  
· Several  unannounced  vulnerabili3es  were  also   addressed  as  part  of  the  variant  discovery  process  
· Requires  understanding  of  several  mechanisms   specific  to  NT  and  win32k  

Agenda  
· IntroducLon   · Win32k  
· Window  Manager   · User--Mode  Callbacks  
· VulnerabiliLes   · Exploitability   · MiLgaLons   · Conclusion  

July  27,  2011  

July  27,  2011  
IntroducLon  
Win32k  and  User--Mode  Callbacks  

Win32k  
July  27,  2011  
· The  Windows  GUI  subsystem  was  tradiLonally   implemented  in  user--mode  
· Used  a  client--server  process  model  
· In  NT  4.0,  a  large  part  of  the  server  component   (in  CSRSS)  was  moved  to  kernel--mode  
· Introduced  Win32k.sys  
· Today,  Win32k  manages  both  the  Window   Manager  (USER)  and  the  Graphics  Device   Interface  (GDI)  

User--Mode  Callbacks  
· Allows  win32k  to  make  calls  back  into  user-- mode  and  operate  on  user--mode  data  
· Invoke  applica3on  defined  hooks   · Provide  event  no3fica3ons   · Read  and  set  proper3es  in  user--mode  structures  
· Implemented  in  the  NT  execuLve  
· nt!KeUserModeCallback   · Works  like  a  reverse  system  call  

July  27,  2011  

Win32k  vs.  User--Mode  Callbacks  
July  27,  2011  
· Win32k  uses  a  global  locking  design  in  creaLng   a  thread--safe  environment  
· Presumably  remnants  of  the  old  subsystem  design  
· Callbacks  "interrupt"  kernel  execuLon  and   allow  win32k  structures  and  object  properLes   to  be  modified  
· Insufficient  checks  or  validaLon  may  result  in   numerous  vulnerabiliLes  
· Use--aMer--frees   · NULL  pointer  dereferences   · ++  

Previous  Work  
July  27,  2011  
· Mxatone  --  Analyzing  local  privilege  escalaLons  in   win32k  (Uninformed  vol.10)  
· Insufficient  valida3on  of  data  returned  from  user--mode   callbacks  
· Win32k  Window  CreaLon  VulnerabiliLes  
· CVE--2010--0484  (MS10--032)  
· Window  parent  not  revalidated  aMer  callbacks  
· CVE--2010--1897  (MS10--048)  
· Pseudo  handle  provided  in  callback  not  sufficiently  validated  
· Stefan  Esser  --  State  of  the  Art  Post  ExploitaLon  in   Hardened  PHP  Environments  (BlackHat  USA  2009)  
· Interrup3on  vulnerabili3es  

Goals  
July  27,  2011  
· Show  how  user--mode  callbacks  without  very   stringent  checks  may  introduce  several  subtle   vulnerabiliLes  
· Show  how  such  vulnerabiliLes  may  be   exploited  using  pool  and  kernel  heap   manipulaLon  
· Propose  a  method  to  generically  miLgate   exploitability  of  NULL  pointer  dereference   vulnerabiliLes  

Win32k  
Architecture  and  Design  

July  27,  2011  

Windows  NT  3.51  

· Modified  microkernel  design  

July  27,  2011  

· File  systems,  network  protocols,  IPC,  and  drivers  are   implemented  in  kernel  mode  

· Followed  a  more  pure  microkernel  approach  in  

its  implementaLon  of  the  GUI  subsystem  

· Window  Manager  and  GDI  implemented  in  the   Client--Server  Run3me  SubSystem  (CSRSS)  

· OpLmized  for  performance  

· Shared  memory  design  

· Paired  threads  between  client  and  server  (FastLPC)  

Windows  NT  3.51  Win32  Subsystem  

Client Server Runtime SubSystem (CSRSS)

Text windowing support

Handles input and manages screen I/O

Window Manager

Console

Drawing library for graphics output devices

Graphics Device Interface

Win32 Subsystem

Supports all components in the subsystem

Operating System Functions

Graphics Device Drivers

Hardware dependent graphics drivers

User

Kernel

Executive Services

Microkernel

HAL

July  27,  2011  

Drawbacks  of  the  NT  3.51  Design  
July  27,  2011  
· Graphics  and  windowing  subsystem  have  a  very   high  rate  of  interacLon  with  hardware  
· Video  drivers,  mouse,  keyboard,  etc.  
· Client--server  interacLon  involves  excessive   thread  and  context  switching  
· Greatly  affects  graphics  rendering  performance  
· High  memory  requirements  
· Uses  64K  shared  memory  buffer  to  accumulate  and   pass  parameters  between  the  client  and  server  

Windows  NT  4.0  
July  27,  2011  
· Moved  the  Window  Manager,  GDI  and  graphics   device  drivers  to  kernel--mode  
· Introduced  win32k.sys  
· Eliminated  the  need  for  shared  buffers  and   paired  threads  
· Results  in  fewer  thread  and  context  switches   · Reduces  memory  requirements  
· Some  old  performance  tricks  were  sLll   maintained  
· E.g.  caching  of  management  structures  in  the  user   mode  por3on  of  the  client's  address  space  

Win32k.sys  in  Windows  NT  4.0  

User Kernel

Console

CSR Subsystem

Window Manager

Graphics Device Interface

Graphics Device Drivers

Microkernel HAL

Win32k.sys

July  27,  2011  

Win32k  
· Kernel  component  of  the  Win32  subsystem   · Implements  the  kernel  side  of  
· Window  Manager  (USER)   · Graphics  Device  Interface  (GDI)  
· Provides  thunks  to  DirectX  interfaces   · Has  it's  own  system  call  table  
· More  than  800  entries  on  Windows  7   · win32k!W32pServiceTable  

July  27,  2011  

Window  Manager  (USER)  
· Several  responsibiliLes  
· Controls  window  displays   · Manages  screen  output   · Collects  input  from  keyboard,  mouse,  etc.   · Calls  applica3on--defined  hooks   · Passes  user  messages  to  applica3ons   · Manages  user  objects  
· The  component  this  talk  will  focus  on  

July  27,  2011  

Graphics  Device  Interface  (GDI)  
July  27,  2011  
· Manages  the  graphics  output  and  rendering  
· Library  of  func3ons  for  graphics  output  devices   · Includes  func3ons  for  line,  text,  and  figure  drawing  
and  for  graphics  manipula3on   · Manages  GDI  objects  such  as  brushes,  pens,  DCs,  
paths,  regions,  etc.   · Provides  APIs  for  video/print  drivers  
· Slow  compared  to  Direct2D/DirectWrite  
· Will  probably  be  replaced  at  some  point  

DirectX  Thunks  

· Entry  point  thunks  for  DirectX  support  

July  27,  2011  

· NtGdiDd*  or  NtGdiDDI*  

· Calls  corresponding  funcLons  in  the  DirectX  

driver  

· dxg.sys  (XDDM)  or  dxgkrnl.sys  (WDDM)  depending  on   the  display  driver  model  used  

· Display  drivers  hook  DXG  interfaces  to  

hardware  accelerate  or  punt  back  to  GDI  

July  27,  2011  
Window  Manager  
User  Objects  and  Thread  Safety  

User  Objects  
July  27,  2011  
· All  user  handles  for  enLLes  such  as  windows  and   cursors  are  backed  by  their  own  object  
· Allocated  in  win32k!HMAllocateObject  
· Each  object  type  is  defined  by  a  unique  structure  
· win32k!tagWND   · win32k!tagCURSOR  
· User  objects  are  indexed  into  a  dedicated  handle   table  maintained  by  win32k  
· Handle  values  are  translated  into  object  pointers   using  the  handle  manager  validaLon  APIs  
· win32k!HMValidateHandle(..)  

User  Object  Header  

July  27,  2011  
· Every  user  object  starts  with  a  HEAD  structure  

· kd>  dt  win32k!_HEAD  

· +0x000  h  

  :  Ptr32  Void   //  handle  value  

· +0x004  cLockObj  :  Uint4B  

  //  lock  count  

· The  lock  count  tracks  object  use  

· An  object  is  freed  when  the  lock  count  reaches  zero  

· AddiLonal  fields  are  defined  if  the  object  is  owned  

by  a  thread  or  process,  or  associated  with  a  

desktop  

· win32k!_THRDESKHEAD  

· win32k!_PROCDESKHEAD  

User  Handle  Table  

· All  user  objects  are  indexed  into  a  per--session  

handle  table  

· Ini3alized  in  win32k!Win32UserIni3alize  

· Pointer  to  the  user  handle  table  is  stored  in  the  

win32k!tagSHAREDINFO  structure  

· user32!gSharedInfo  (Win  7)  or  win32k!gSharedInfo  

·   kd>  dt  win32k!tagSHAREDINFO  

· +0x000  psi

  

  :  Ptr32  tagSERVERINFO  

· +0x004  aheList   

  :  Ptr32  _HANDLEENTRY  

· +0x008  HeEntrySize   :  Uint4B  

· +0x00c  pDispInfo  

  :  Ptr32  tagDISPLAYINFO  

· +0x010  ulSharedDelta   :  Uint4B  

July  27,  2011  

User  Handle  Table  Entries  

July  27,  2011  
· Each  entry  in  the  user  handle  table  is  represented  

by  a  HANDLEENTRY  structure  

· kd>  dt  win32k!_HANDLEENTRY  

· +0x000  phead   

  :  Ptr32  _HEAD  

· +0x004  pOwner   

  :  Ptr32  Void  

· +0x008  bType   

  :  Uchar  

· +0x009  bFlags   

  :  Uchar  

· +0x00a  wUniq   

  :  Uint2B  

· Holds  pointers  to  the  object,  its  owner,  type,  flags,  

and  a  unique  seed  for  the  handle  values  

· handle  =  handle_table_index  |  (wUniq  <<  0x10)  

· wUniq  is  incremented  on  object  free  

User  Handle  Table  Entries  

object owner

0

0

ff9d1d28

0

ffbbd498 ffb09678

ffb658f0 ffbbc958

ff650618 ffb09678

ffb64918 ffbbc958

bType 0 c 1 3 1 3

bFlags 0 0 40 0 0 0

wUniq 0 1 1 1 1 1

Pointer to object in kernel memory
Pointer to owner (THREADINFO or PROCESSINFO)

Object type (e.g. window, cursor,
menu, etc.)

Unique counter

Object flags (e.g. being destroyed)

July  27,  2011  

User  Objects  In  Memory  
July  27,  2011  
· User  objects  are  stored  in  the  session  pool,  the   desktop  heap  or  the  shared  heap  
· Set  in  the  handle  type  informa3on  table  (win32k! gah3)  
· The  desktop  heap  and  shared  heap  are  read-- only  mapped  into  user  address  space  
· Used  to  avoid  kernel  transi3ons  
· Objects  associated  with  a  parLcular  desktop   are  stored  on  the  desktop  heap  
· Remaining  objects  are  stored  in  the  shared   heap  or  the  session  pool  

Handle  Table  &  Objects  In  Memory  

User
Application Read-only mapped memory
Desktop Heap
Shared Section
User Handle Table
Shared Heap

Kernel

Desktop Heap

Object

Object

Shared Section
User Handle Table

Shared Heap

Object

Object

July  27,  2011  
Session Pool
Object Object

Shared  SecLon  User  Mapping  

· The  shared  secLon  is  mapped  into  a  GUI  process   upon  iniLalizing  the  client  Win32  subsystem  
· Essen3ally  means  loading  user32.dll   · Mapping  itself  is  performed  by  CSRSS  in  calling  
NtUserProcessConnect  (InitMapSharedSec3on)  
· The  user  handle  table,  at  the  base  of  the  shared   secLon,  can  be  obtained  in  at  least  two  ways  
· From  user32!gSharedInfo  (exported  on  Windows  7)   · From  the  connec3on  informa3on  buffer  returned  by  
CsrClientConnectToServer  upon  specifying   USERSRV_SEVERDLL_INDEX  (3)  

July  27,  2011  

Handle  Table  From  User--Mode  

July  27,  2011  

Desktop  Heap  User  Mapping  
July  27,  2011  
· For  each  GUI  thread,  win32k  maps  the  associated   desktop  heap  into  the  user--mode  process  
· Performed  by  win32k!MapDesktop  
· InformaLon  on  the  desktop  heap  is  stored  in  the   desktop  informaLon  structure  
· Holds  the  kernel  address  of  the  desktop  heap   · Accessible  from  user--mode  
· NtCurrentTeb()-->Win32ClientInfo.pDeskInfo  
· kd>  dt  win32k!tagDESKTOPINFO  
· +0x000  pvDesktopBase   :  Ptr32  Void   · +0x004  pvDestkopLimit   :  Ptr32  Void  

Kernel--Mode  -->  User--Mode  Address  

· User--space  address  of  desktop  heap  objects  are   computed  using  ulClientDelta    
· NtCurrentTeb()-->Win32ClientInfo.ulClientDelta  
· User--space  address  of  shared  heap  objects  are   computed  using  ulSharedDelta  
· Defined  in  win32k!tagSHAREDINFO  
ulClientDelta

July  27,  2011  

Desktop Heap

Window

Cursor

Desktop Heap

Window

Cursor

User

Kernel

User  Object  From  User--Mode  
HEAD structure Window procedure

July  27,  2011  

User  Object  Types  

· On  Windows  7,  there  are  21  different  user   object  types  (22  including  the  `free'  type)  
· Includes  `touch'  and  `gesture'  objects  
· InformaLon  on  each  type  is  stored  in  the   handle  type  informaLon  table  
· win32k!gh3  (undocumented  structure)   · Defines  the  destroy  rou3nes  for  each  type   · Defines  target  memory  loca3on  (desktop/shared  
heap,  session  pool)  

July  27,  2011  

User  Object  Types  #1  

ID

TYPE

OWNER

MEMORY

July  27,  2011  

0

Free

1

Window

Thread

Desktop Heap / Session Pool *

2

Menu

Process

Desktop Heap

3

Cursor

Process

Session Pool

4

SetWindowPos

Thread

Session Pool

5

Hook

Thread

Desktop Heap

6

Clipboard Data

Session Pool

7

CallProcData

Process

Desktop Heap

8

Accelerator

Process

Session Pool

9

DDE Access

Thread

Session Pool

10

DDE Conversation

Thread

Session Pool

* Stored on the desktop heap if the window is associated with a desktop

User  Object  Types  #2  

ID 11 12 13 14 15 16 17 18 19 20 (Win 7) 21 (Win 7)

TYPE DDE Transaction Monitor Keyboard Layout Keyboard File Event Hook Timer Input Context Hid Data Device Info Touch Gesture

OWNER Thread
Thread Thread Thread Thread Thread

MEMORY

July  27,  2011  

Session Pool

Shared Heap

Session Pool

Session Pool

Session Pool

Session Pool

Desktop Heap

Session Pool

Session Pool

Session Pool

Session Pool

User  CriLcal  SecLon  

· Unlike  NT,  the  Window  Manager  does  not  

July  27,  2011  

exclusively  lock  each  user  object  

· Implements  a  global  lock  per  session  

· Each  kernel  rouLne  that  operates  on  win32k  

structures  or  objects  must  first  acquire  a  lock  

on  win32k!gpresUser  

· Exclusive  lock  used  if  write  opera3ons  are  involved  

· Otherwise,  shared  lock  is  used  

· Clearly  not  designed  to  be  mulLthreaded  

· E.g.  two  separate  applica3ons  in  the  same  session   cannot  process  their  message  queues  simultaneously  

Shared  and  Exclusive  Locks  
Acquire shared lock

July  27,  2011  

Acquire exclusive lock

User--Mode  Callbacks  
Kernel  to  User  InteracLon  

July  27,  2011  

User--Mode  Callbacks  
July  27,  2011  
· In  interacLng  with  user--mode  data,  win32k  is   required  to  make  calls  back  into  user--mode  
· Lead  to  the  concept  of  user--mode  callbacks  
· Implemented  in  nt!KeUserModeCallback  
· Works  like  a  reverse  system  call   · Previously  researched  by  Ivanlef0u  and  mxatone,  
among  others  
· Used  extensively  in  user  object  handling  

KeUserModeCallback  

· NTSTATUS  KeUserModeCallback  (  

July  27,  2011  

  IN  ULONG  ApiNumber,  

  IN  PVOID  InputBuffer,  

  IN  ULONG  InputLength,  

  OUT  PVOID  *  OutputBuffer,  

  IN  PULONG  OutputLength  );  

· ApiNumber  is  an  index  into  the  user--mode  callback  

funcLon  table  

· Copied  to  the  Process  Environment  Block  (PEB)  during  the   ini3aliza3on  of  USER32.dll  in  a  given  process  

· kd>  dt  nt!_PEB  KernelCallbackTable  

· +0x02c  KernelCallbackTable  :  Ptr32  Void  

KeUserModeCallback  Internals  
July  27,  2011  
· In  a  system  call,  a  trap  frame  is  stored  on  the   kernel  thread  stack  by  KiSystemService  or   KiFastCallEntry  
· Used  to  save  thread  context  and  restore  registers   upon  returning  to  user--mode  
· KeUserModeCallback  creates  a  new  trap  frame   (KTRAP_FRAME)  before  invoking  KiServiceExit  
· Sets  EIP  to  ntdll!KiUserCallbackDispatcher   · Replaces  TrapFrame  pointer  of  the  current  thread  
· Input  buffer  is  copied  to  the  user--mode  stack  

KeUserModeCallback  

Create new TRAP_FRAME and set EIP to KiUserCallbackDispatcher

Restore original TRAP_FRAME

July  27,  2011  

kernel user

KeUserModeCallback

NTOSKRNL

Switch to kernel callback stack

NtCallbackReturn
Restore original kernel stack

KiUserCallbackDispatcher

NTDLL

NtCallbackReturn

KernelCallbackTable

__ ClientLoadLibrary __ ClientEventCallback

kd> dps poi(7ffda000+2c) l69 75ccf620 75cb6443 user32!__fnCOPYDATA 75ccf624 75cff0e4 user32!__fnCOPYGLOBALDATA 75ccf628 75cc736b user32!__fnDWORD 75ccf62c 75cbd603 user32!__fnNCDESTROY 75ccf630 75ce50f9 user32!__fnDWORDOPTINLPMSG 75ccf634 75cff1be user32!__fnINOUTDRAG 75ccf638 75ce6cd0 user32!__fnGETTEXTLENGTHS 75ccf63c 75cff412 user32!__fnINCNTOUTSTRING

USER32
CallbackFunction

User application

Kernel  Callback  Stack  

· On  Vista/Windows  7,  the  kernel  creates  a  new  kernel J uly  27,  2011   thread  stack  for  use  during  the  user--mode  callback  
· Windows  XP  would  simply  grow  the  exis3ng  stack  
· The  new  trap  frame  is  stored  on  the  new  kernel  stack  
· InformaLon  on  the  previous  kernel  stack  is  stored  in  a   KSTACK_AREA  structure  
· Stored  at  the  base  of  every  kernel  thread  stack  

kd> dt nt!_KSTACK_AREA +0x000 FnArea +0x000 NpxFrame +0x1e0 StackControl +0x1fc Cr0NpxState +0x200 Padding

: _FNSAVE_FORMAT : _FXSAVE_FORMAT : _KERNEL_STACK_CONTROL : Uint4B : [4] Uint4B

kd> dt nt!_KERNEL_STACK_CONTROL -b

+0x000 PreviousTrapFrame : Ptr32

+0x000 PreviousExceptionList : Ptr32

+0x004 StackControlFlags : Uint4B

+0x004 PreviousLargeStack : Pos 0, 1 Bit

+0x004 PreviousSegmentsPresent : Pos 1, 1 Bit

+0x004 ExpandCalloutStack : Pos 2, 1 Bit

+0x008 Previous

: _KERNEL_STACK_SEGMENT

+0x000 StackBase

: Uint4B

+0x004 StackLimit

: Uint4B

+0x008 KernelStack

: Uint4B

+0x00c InitialStack

: Uint4B

+0x010 ActualLimit

: Uint4B

Kernel  Callback  Stack  Layout  
Kernel callback stack

July  27,  2011  

New stack pointer (ESP/RSP)
Information on previous trap frame and kernel stack
(address, etc.)

KTRAP_FRAME KSTACK_AREA

Trap frame with EIP = ntdll! KiUserCallbackDispatcher

Kernel stack base

NtCallbackReturn  

· NTSTATUS  NtCallbackReturn  (  

July  27,  2011  

  IN  PVOID  Result  OPTIONAL,  

  IN  ULONG  ResultLength,  

  IN  NTSTATUS  Status  );  

· Used  to  resume  execuLon  in  the  kernel  aser  a  

user--mode  callback  

· Copies  the  result  of  the  callback  back  to  the  

original  kernel  stack  

· Restores  original  trap  frame  and  kernel  stack  by  

using  the  informaLon  held  in  the  KSTACK_AREA  

· Deletes  the  kernel  callback  stack  upon  compleLon  

ApplicaLons  of  User--Mode  Callbacks  
July  27,  2011  
· User--mode  callbacks  allow  win32k  to  perform  a   variety  of  tasks  
· Invoke  applica3on--specific  windows  hooks   · Provide  event  no3fica3on   · Copy  data  to  and  from  user--mode  (e.g.  for  DDE)  
· Hooks  allow  users  to  execute  code  in  response   to  certain  acLons  performed  by  win32k  
· Calling  a  window  procedure   · Crea3ng  or  destroying     · Processing  keyboard  or  mouse  input  

Windows  Hooks  

· Set  using  the  SetWindowsHook  APIs  

July  27,  2011  

· Invoked  by  the  kernel  through  calls  to  xxxCallHook  

· Typically  used  to  monitor  certain  system  events   and  their  associated  paramters  

· May  alter  funcLon  parameters  depending  on   the  type  of  hook  

· E.g.  change  the  z--ordering  of  a  window  in  a  create   window  hook  

· Processed  synchronously  

· The  user--mode  hook  is  called  immediately  at  the  3me   when  the  appropriate  condi3ons  are  met  

CreateWindow  CBT  Hook  Example  
User Kernel

July  27,  2011  

Application calls CreateWindowEx

Creates window object

Assigns class to window object

User-defined CBT Hook Function

Invoke CBT hook (if set)

Handle returned to application

...

Sends WM_CREATE message

Sends WM_NCCREATE
message

Event  Hooks  

· Set  using  the  SetWinEventHook  APIs  

July  27,  2011  

· Invoked  by  the  kernel  through  calls  to   xxxWindowEvent  

· Used  to  noLfy  a  user--mode  process  that  a  

certain  event  occured  or  is  about  to  occur  

· E.g.  inform  that  a  new  window  has  been  created  

· Can  be  processed  both  synchronously  and  

asynchronously  (deferred  events)  

· In  the  laser  case,  the  kernel  calls   xxxFlushDeferredWindowEvents  to  flush  the  event   queue  

July  27,  2011  
Kernel  A(acks  through  User--Mode   Callbacks  
VulnerabiliLes  in  Win32k  

User  CriLcal  SecLon  vs.  Callbacks  
July  27,  2011  
· Whenever  a  callback  is  executed,  the  kernel   leaves  the  win32k  user  criLcal  secLon  
· Allows  win32k  to  perform  other  tasks  while  user-- mode  code  is  being  executed  
· Upon  returning  from  a  callback,  win32k  must   ensure  that  referenced  objects  are  sLll  in  the   expected  state  
· E.g.  a  callback  could  call  SetParent()  to  update  the   parent  of  a  window  
· Insufficient  checks  may  lead  to  vulnerabiliLes  

FuncLon  Name  DecoraLon  
July  27,  2011  
· Win32k.sys  uses  funcLon  name  decoraLon  to  keep   track  of  funcLons  that  leave  the  criLcal  secLon  
· Prefixed  "xxx"  and  "zzz"  
· FuncLons  prefixed  "xxx"  may  leave  the  criLcal   secLon  and  invoke  a  user--mode  callback  
· May  some3mes  require  a  specific  argument  or  set  of   arguments  to  trigger  the  actual  callback  
· FuncLons  prefixed  "zzz"  may  invoke  a  user--mode   callback  if  win32k!gdwDeferWinEvent  is  null  
· Otherwise,  a  deferred  window  event  no3fica3on  is  sent  

FuncLon  Name  DecoraLon  Issues  

July  27,  2011  
· FuncLons  that  leave  the  criLcal  secLon  and  invoke   user--mode  callbacks  are  not  always  prefixed  
· Could  lead  to  invalid  assump3ons  by  the  programmer   · Easy  to  spot  using  IDAPython  and  cross  referencing  
· Lack  of  consistency  in  behavior  of  "zzz"  funcLons  
· Some  "zzz"  func3ons  seem  to  increment   gdwDeferWinEvent  while  others  do  not  

Windows 7 RTM MNRecalcTabStrings FreeDDEHandle ClientFreeDDEHandle

Windows 7 (MS11-034) xxxMNRecalcTabStrings xxxFreeDDEHandle xxxClientFreeDDEHandle

LocaLng  Undecorated  FuncLons  

July  27,  2011  

Undecorated functions that potentially may invoke
callbacks

Search for functions that may call KeUserModeCallback or
leave the user critical section

Object  Locking  
July  27,  2011  
· Objects  expected  to  be  valid  aser  the  kernel   leaves  the  user  criLcal  secLon,  must  be  locked  
· The  cLockObj  field  of  the  common  object  header   stores  the  object  reference  count  
· Two  forms  of  locking  
· Thread  locking   · Assignment  locking  

Thread  Locking  
July  27,  2011  
· Used  to  lock  objects  or  buffers  within  the  context   of  a  thread  
· ThreadLock*  (inlined  mostly)  and  ThreadUnlock*  
· Each  thread  locked  entry  is  stored  as  a  TL  structure  
· kd>  dt  win32k!_TL   · +0x000  next   :  Ptr32  _TL   · +0x004  pobj   :  Ptr32  Void   · +0x008  pfnFree   :  Ptr32  Void    
· Pointer  to  the  thread  lock  list  is  stored  in  the   THREADINFO  structure  of  a  thread  object  
· Upon  thread  terminaLon,  the  thread  lock  list  is   processed  to  release  any  remaining  entries  
· xxxDestroyThreadInfo  -->  DestroyThreadsObjects  

Thread  Locking  By  Example  

July  27,  2011  

xxx function = possible callback
Thread lock released

Thread lock entry added to TL list
Object lock count incremented

Assignment  Locking  
July  27,  2011  
· The  handle  manager  provides  funcLons  for   thread  independent  locking  of  objects  
· HMAssignmentLock(Address,Object)   · HMAssignmentUnlock(Address)  
· Assignment  locking  an  object  to  an  address   with  an  iniLalized  pointer,  releases  the  exisLng   reference  
· Does  not  provide  the  safety  net  thread  locking   does  
· E.g.  if  a  thread  termina3on  occurs  in  a  callback,  the   thread  cleanup  code  must  release  these  references  

Object  Locking  VulnerabiliLes  
July  27,  2011  
· Any  object  expected  to  be  valid  aser  a  user-- mode  callback  should  be  locked  
· Similarly,  any  object  that  no  longer  is  used  by  a   parLcular  component  should  be  released  
· Mismanagement  in  the  locking  and  release  of   objects  could  result  in  the  following  
· No  reten3on:  An  object  could  be  freed  too  early   · No  release:  An  object  could  never  be  freed,  or  the  
reference  count  could  wrap  

Object  Use--Aser--Free  

User

Kernel

Free object e.g. DestroyWindow()
User-mode function

Get object pointer
Absent locking
User-mode callback

Use after free
Operate on object

July  27,  2011  

Window  Object  Use--Aser--Free  
July  27,  2011  
· In  creaLng  a  window,  an  applicaLon  can  adjust   its  orientaLon  and  z--order  using  a  CBT  hook  
· Z--order  is  defined  by  providing  the  handle  to  the   window  aMer  which  the  new  window  is  inserted  
· win32k!xxxCreateWindowEx  failed  to  properly   lock  the  provided  z--order  window  
· Only  stored  a  pointer  to  the  object  in  a  local  variable  
· An  a(acker  could  destroy  the  window  in  a   subsequent  user--mode  callback  and  trigger  a   use--aser--free  

Window  Object  Use--Aser--Free  

July  27,  2011  

Operate on freed object

Get object pointer from handle (cbt.hwndInsertAfter)
User-mode callback(s) DestroyWindow(hwnd)

Keyboard  Layout  Object  Use--Aser--Free  

· In  loading  a  keyboard  layout,  win32k!

July  27,  2011  

xxxLoadKeyboardLayoutEx  did  not  lock  the  

keyboard  layout  object  

· Pointer  stored  in  local  variable  

· An  a(acker  could  unload  the  keyboard  layout  

in  a  user--mode  callback  and  thus  free  the  

object  

· Subsequently,  upon  using  the  object  pointer  

the  kernel  would  operate  on  freed  memory  

Keyboard  Layout  Object  Use--Aser--Free  
Get object pointer from handle (hkl)

July  27,  2011  

User-mode callback(s) UnloadKeyboardLayout (hkl)
Operate on freed object

Pointer to freed memory

Object  State  ValidaLon  
July  27,  2011  
· Objects  assumed  to  be  in  a  certain  state  should   always  have  their  state  validated  
· Usually  involves  checking  for  ini3alized  pointers  or   flags  
· User--mode  callbacks  could  alter  the  state  and   update  properLes  of  objects  
· A  drop  down  menu  is  no  longer  ac3ve   · The  parent  of  a  window  has  changed   · The  partner  in  a  DDE  conversa3on  terminated  
· Lack  of  state  checking  could  result  in  bugs  such   as  null--pointer  dereferences  or  use--aser--frees  

DDE  ConversaLon  State  VulnerabiliLes  

· Dynamic  Data  Exchange  (DDE)  

July  27,  2011  

· Legacy  protocol  using  messages  and  shared  memory  to   exchange  data  between  applica3ons  

· Several  funcLons  did  not  sufficiently  validate  DDE  

conversaLon  objects  aser  user--mode  callbacks  

· Used  to  copy  data  in  and  out  from  user--mode  

· An  a(acker  could  terminate  a  conversaLon  in  a  

user--mode  callback  and  thus  unlock  the  partner  

conversaLon  object  

· Could  result  in  a  NULL  pointer  dereference  as  the  func3on   did  not  revalidate  the  conversa3on  object  pointer  

DDE  ConversaLon  Message  Handling  
July  27,  2011  

Conversation Object (Client)

PostMessage / GetMessage

Message Transmit

PostMessage / GetMessage

Kernel

DDE Handling

DDE Handling

User-mode callback

Client Window

Data Copy
User-mode callback

Data Copy

Conversation Object (Server)
Server Window

DDE  ConversaLon  Object  NULL  Dereference  
July  27,  2011  

Copy data to be sent in from user-mode

Terminate the conversation in a user-mode callback User-mode callback(s)
Possible NULL pointer dereference

Buffer  ReallocaLon  
July  27,  2011  
· Many  user  objects  have  item  arrays  or  other   forms  of  buffers  associated  with  them  
· E.g.  menu  items  array  
· Item  arrays  where  elements  are  added  or   removed  are  osen  resized  to  conserve  memory  
· Buffer  freed  if  the  array  is  empty   · Buffer  reallocated  if  elements  is  above  or  below  a  
certain  threshold  
· Any  buffer  that  can  be  reallocated  or  freed   during  a  callback  must  be  checked  upon  return  
· Failure  to  do  so  could  result  in  use--aMer--free  

Buffer  ReallocaLon  

Get number of items in array (k)
Get pointer to array

Kernel

Should revalidate buffer pointer

Item = array[n]

Operate on item (user-mode callback)

Should revalidate number of items (k)
if (++n < k)

User

July  27,  2011  

Resize or delete array in callback

Menu  Item  Array  Use--Aser--Frees  
July  27,  2011  
· Menus  may  hold  an  arbitrary  number  of  menu   items  
· Stored  in  a  dynamically  sized  array  pointed  to  by  the  menu   object  structure  (win32k!tagMENU)  
· Win32k  did  not  revalidate  the  menu  items  array   pointer  aser  user--mode  callbacks  
· No  way  to  "lock"  a  menu  item   · Any  `xxx'  func3on  opera3ng  on  menu  items  was  
poten3ally  vulnerable  
· An  a(acker  could  cause  the  buffer  to  be   reallocated  in  a  callback  and  trigger  a  use--aser--free  

Menu  Item  Array  ReallocaLon  

July  27,  2011  

CreatePopupMenu() or CreateMenu()
MENU Object

9th InsertMenuItem(...) expands array by 8 items and forces reallocation

1st InsertMenuItem(...) creates menu items array of 8 tagITEM
entries

Menu  Item  Processing  Use--Aser--Free  
July  27,  2011  
Resize array in callback User-mode callback rgItems pointer (ebx) is not revalidated
cItems (array count) is not revalidated

SetWindowPos  Array  Use--Aser--Frees  
July  27,  2011  
· SMWP  objects  are  used  to  update  the  posiLon  of   mulLple  windows  at  once  
· Created  in  BeginDeferWindowPos(  int  dwNum  )   · Hold  a  dynamically  sized  array  of  mul3ple  window  posi3on  
structures  
· In  operaLng  on  the  SMWP  array,  win32k  did  not   revalidate  the  array  pointer  aser  user--mode   callbacks  
· An  a(acker  could  force  the  array  to  be  reallocated   by  inserLng  entries  using  DeferWindowPos(...)  and   trigger  a  use--aser--free  

SetWindowPos  Array  ReallocaLon  

BeginDeferWindowPos (4)
SMWP Object

DeferWindowPos(...) fills SMWP array entries

July  27,  2011  

Creates SMWP array of 4 entries

5th DeferWindowPos(...) expands array by 4 items and forces reallocation

SMWP  Item  Processing  Use--Aser--Free  
July  27,  2011  

EBX may point to freed memory!

Resize array in callback

User-mode callback

Get next item in array

Time--of--Check--to--Time--of--Use  
July  27,  2011  
· The  user  criLcal  secLon  is  generally  used  to   prevent  TOCTTOU  issues  in  user  object  handling  
· User--mode  callbacks  may  allow  an  asacker  to   manipulate  an  object  or  global  value  before  it  is  used  
· Can  be  parLcularly  dangerous  in  clean  up   rouLnes  
· May  invoke  callbacks  aMer  checks  have  been  made   · Could  result  in  stale  references  to  objects  or  buffers  
· Values  that  may  have  changed  must  always  be   (re)checked  aser  a  callback  has  taken  place  

Time--of--Check--to--Time--of--Use  

User-mode callback if event hook is set

Attempts to destroy window without rechecking object pointer

Checks pointer to alt-tab window
Assignment locked pointer

July  27,  2011  

Null

Handle  ValidaLon  
July  27,  2011  
· Required  to  validate  handles,  their  type,  and   retrieve  the  corresponding  object  pointers  
· HMValidateHandle()  and  friends  
· Generic  handle  validaLon  should  be  avoided   unless  the  structure  of  the  object  is  irrelevant  
· Only  checks  handle  table  entry  and  ignores  type  
· FuncLons  that  revalidate  handles  aser   callbacks,  may  no  longer  be  operaLng  on  the   same  object  
· The  uniqueness  counter  designed  to  provide  handle   entropy  is  only  16--bit  

Insufficient  Handle  ValidaLon  

July  27,  2011  

Function did not check handle type nor validate
index in handle table

Function did not check that object was an image (icon/
cursor)

July  27,  2011  
Exploitability  
Use--Aser--Frees  and  NULL  Pointer   Dereferences  

Vulnerability  PrimiLves  

· Mainly  dealing  with  two  vulnerability  

July  27,  2011  

primiLves  

· Use--AMer--Frees  

· Null--Pointer  Dereferences  

· Exploitability  may  depend  on  the  a(acker's  

ability  to  manipulate  heap  and  pool  memory  

· Kernel  Pool  Exploita3on  on  Windows  7  (BH  DC  `11)  

· Not  much  public  informa3on  on  the  kernel  heap  

· Hooking  user--mode  callbacks  is  easy  

· NtCurrentPeb()-->KernelCallbackTable  

Kernel  Heap  
July  27,  2011  
· The  kernel  has  a  stripped  down  version  of  the   user--mode  heap  allocator  
· nt!RtlAllocateHeap,  nt!RtlFreeHeap,  etc.   · Used  by  the  shared  and  desktop  heaps  
· Neither  heaps  employ  any  front  end  allocators  
· ExtendedLookup  ==  NULL   · No  low  fragmenta3on  heap  or  lookaside  lists  
· Neither  heaps  encode  or  obfuscate  heap   management  structures  
· HEAP.EncodeFlagMask  ==  0  

Desktop  Heap  Base  

EncodingFlagMask and PointerKey

No front end allocators

July  27,  2011  

Free list
Commit routine to extend the heap

Kernel  Heap  Management  
July  27,  2011  
· Freed  memory  is  indexed  into  a  single  free  list  
· Ordered  by  block  size   · ListHints  used  to  op3mize  list  lookup  
· Requested  memory  is  always  pulled  from  the  front   of  an  oversized  heap  chunk  
· Remaining  fragment  is  put  back  into  the  free  list  
· If  the  heap  runs  out  of  commi(ed  memory,  win32k   calls  the  CommitRou7ne  to  extend  the  heap  
· Asempts  to  commit  memory  from  the  reserved  range   · E.g.  win32k  reserves  0xC00000  bytes  by  default  
(adjustable  by  user)  for  desktop  heaps  

Use--Aser--Free  ExploitaLon  
July  27,  2011  
· Unicode  strings  can  be  used  to  reallocate  freed   memory  from  within  user--mode  callbacks  
· Allows  control  of  the  contents  and  size  of  the  heap   block  
· Caveat:  Cannot  use  WORD  NULLs  and  last  two  bytes   must  be  NULL  to  terminate  the  string  
· Desktop  heap  
· SetWindowTextW(hWnd,String);  
· Session  pool  
· SetClassLongPtr(hWnd,GCLP_MENUNAME, (LONG)String);

Strings  As  User  Objects  
Arbitrary memory corruption
Unicode string allocated in place of
freed object

July  27,  2011  

ExploiLng  Object  Locking  Behavior  
July  27,  2011  
· Embedded  object  pointers  in  the  freed  object   may  allow  an  a(acker  to  increment  (lock)  or   decrement  (unlock)  an  arbitrary  address  
· Common  behavior  of  locking  rou3nes  
· Some  targets  
· HANDLEENTRY.bType  
· Decrement  the  type  of  a  window  handle  table  entry  (1)   · Destroy  rou3ne  for  free  type  (0)  is  null  (mappable  by  user)  
· KAPC.ApcMode  
· Execute  code  with  kernel--mode  privileges  by  decremen3ng   UserMode  (1)  to  KernelMode  (0)  

ExploiLng  Object  Locking  Behavior  

July  27,  2011  

Unlocking user-controlled pointer (0xdeadbeef)

HMAssignmentLock unlocks the existing user-
controlled pointer

NULL  Pointer  VulnerabiliLes  

· PotenLally  exploitable  on  the  Windows   plauorm  

July  27,  2011  

· Non--privileged  users  can  map  the  null  page,  e.g.  via   NtAllocateVirtualMemory  or  NtMapViewOfFile  

· Many  NULL  pointer  vulnerabiliLes  are  

concerned  with  window  object  pointers  

· An  a(acker  could  map  the  null  page  and  set  up  

a  fake  window  object  

· E.g.  define  a  server--side  window  procedure  and   handle  messages  with  kernel  level  privileges  

NULL  Pointer  Object  ExploitaLon  

July  27,  2011  

Server-side window procedure pointer

Message sent to null pointer object
Fake null page window object

Demo  

· Window  Object  Use--Aser--Free   (CVE--2011--1237)  
· Arbitrary  kernel  code  execu3on  via  HANDLEENTRY   corrup3on  

July  27,  2011  

July  27,  2011  
MiLgaLons  
ProtecLng  Against  Privilege  EscalaLon   VulnerabiliLes  

Why?  

· ProacLvely  address  kernel  vulnerabiliLes  
· Only  a  ques3on  un3l  the  next  0--day  may  hit  
· Reduce  impact  and  severity  by  miLgaLng   exploitability  
· DEP  and  ASLR  are  good  examples  
· Offer  workarounds  unLl  a  fix  is  released  
· Time  of  disclosure  un3l  fix  may  be  several  months  

July  27,  2011  

MiLgaLng  Use--Aser--Free  ExploitaLon  

· Need  to  address  an  a(acker's  ability  to   reallocate  the  freed  memory  before  use  

July  27,  2011  

· Some  approaches  

· Delayed  frees  while  processing  a  callback  

· Dedicated  free  lists  for  user  objects  

· Isolate  strings  used  in  realloca3ng  memory  

· Track  alloca3ons  between  ring  transi3ons,  e.g.   pointers  on  the  stack  before  a  callback  

· Generally  hard  to  miLgate  without  significantly  

impacLng  performance  

MiLgaLng  NULL  Pointer  ExploitaLon  
July  27,  2011  
· We  can  address  null  pointer  exploitaLon  by   denying  users  the  ability  to  map  the  null  page  
· Some  potenLal  ways  of  addressing  null  page   mappings  
· System  call  hooking   · Page  Table  Entry  (PTE)  modifica3on   · VAD  manipula3on  
· System  call  hooking  not  supported  on  x64   · PTE  modificaLon  requires  page  to  be  mapped  

VAD  ManipulaLon  
July  27,  2011  
· User  mode  process  space  is  described  using   Virtual  Address  Descriptors  (VADs)  
· Structured  in  self--balanced  AVL  trees  
· VADs  are  always  checked  before  PTEs  are   created  
· E.g.  used  to  implement  the  NO_ACCESS  protec3on  
· VADs  are  used  to  secure  memory,  e.g.  made   non--deletable  
· PEBs  and  TEBs   · KUSER_SHARED_DATA  sec3on  

VAD  Tree  

Process Object (EPROCESS)

VadRoot (MM_AVL_TABLE)

VAD: 85a52db0 77cb0 ­ 77deb
EXECUTE_WCOPY Mapped

Control Area Flags: Accessed, File, Image, ...

July  27,  2011  
File Object Name: [...]
\ntdll.dll

VAD: 871f1418 1f0 ­ 2ef
READWRITE Private

VAD: 85985008 7ffb0 ­ 7ffd2 READONLY Mapped

VAD: 85a52ce8 30 ­ 33
READONLY Mapped

VAD: 85a551a0 dc0 ­ de2
EXECUTE_WCOPY Mapped

VAD: 859f9a28 77ef0 ­ 77ef0
EXECUTE_WCOPY Mapped

VAD: 859850d8 7ffd6 ­ 7ffd6 READWRITE Private

RestricLng  Null  Page  Access  

· We  insert  a  crased  VAD  entry  to  restrict  null   page  access  
· Ring3  code  cannot  modify  the  VAD  entry  
· Avoid  deleLon  using  the  same  method   employed  by  PEBs  and  TEBs  
· Secure  address  range  from  0  up  to  0xFFFF   · Set  protec3on  to  NO_ACCESS  
· Use  a  special  VAD  flag  to  prevent  memory   commits  
· Protec3on  cannot  be  changed  on  uncommised   memory!  

July  27,  2011  

VAD  Tree  /w  Crased  Entry  

Crafted NO_ACCESS VAD inserted at
leftmost branch in VAD tree

VAD: 85a52ad8 10 ­ 1f
READWRITE Mapped

VAD: 876c26c0 0 ­ f
NO_ACCESS Private

VAD: 85985128 20 ­ 2f
READWRITE Mapped

July  27,  2011  

Manipulated  Process  VAD  Tree  
Crafted NO_ACCESS Vad

July  27,  2011  

Invalid memory

MiLgaLon  Results  

Function

Addr

Type

NtAllocateVirtualMemory 1

MEM_RESERVE

NtAllocateVirtualMemory 1

MEM_COMMIT

NtMapViewOfSection

1 MEM_DOS_LIM*

NtProtectVirtualMemory

0

NtProtectVirtualmemory

0

NtFreeVirtualMemory

0

MEM_RELEASE

Protection READONLY READONLY READONLY READWRITE READONLY

July  27,  2011  
Result 0xC0000018 0xC0000018 0xC0000018 0xC000002D 0xC0000045 0xC0000045

0xC0000018 0xC000002D 0xC0000045

STATUS_CONFLICTING_ADDRESSES STATUS_NOT_COMMITTED STATUS_INVALID_PAGE_PROTECTION

*Allows section mapping on page boundary on x86 platforms

Demo  
· Null  page  mapping  miLgaLon  

July  27,  2011  

Conclusion  
Remarks  and  Conclusion  

July  27,  2011  

Future  of  the  Win32k  Subsystem  
July  27,  2011  
· Win32k  needs  a  much  more  consistent  and   security  oriented  design  
· It  should  not  be  necessary  for  the  kernel  to  make   direct  calls  back  into  user--mode  
· Reconsider  performance  benefit  of  shared  user  and   kernel--mode  memory  mappings  
· The  Window  Manager  should  provide  mutual   exclusion  on  a  per--object  basis  
· Beser  suited  towards  mul3core  architectures   · Similar  to  what  is  done  in  GDI  and  the  NT  execu3ve  

Conclusion  

· Legacy  components  consLtute  the  most  

July  27,  2011  

vulnerable  parts  of  an  operaLng  system  

· Security  is  not  usually  part  of  the  original  design  

· Win32k  is  built  around  very  old  GUI  subsystem  code  

· Kernel  exploitaLon  requires  knowledge  about  

the  kernel  address  space  

· Limi3ng  access  to  such  informa3on  is  important  

· Although  hard,  miLgaLng  Windows  kernel  

exploitaLon  is  possible  

References  
· Windows  Kernel  Internals:  Win32K.sys  
· David  B.  Probert,  MicrosoM  
· Analyzing  Local  Privilege  EscalaLons  in  win32k  
· mxatone  (Uninformed  Vol.  10)  
· Windows  CreaLon  Vulnerability  (MS10--048)  
· Nicolás  Economou  
· Pointers  and  Handles:  A  Story  of  Unchecked   AssumpLons  in  the  Windows  Kernel  
· Alex  Ionescu  
· Understanding  the  Low  FragmentaLon  Heap  
· Chris  Valasek  

July  27,  2011  

QuesLons  ?  

· Email:  kernelpool@gmail.com  

July  27,  2011  

· Blog:  h(p://mista.nu/blog  

· Twi(er:  @kernelpool  

· Norman  MDT  Blog:   h(p://blogs.norman.com/category/malware--

detecLon--team  

