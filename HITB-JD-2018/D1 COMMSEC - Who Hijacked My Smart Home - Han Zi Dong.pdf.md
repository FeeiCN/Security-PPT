Who hijacked My Smart Home
--A url hacked all IOT devices
Han Zidong@tencent

Self Introduction
l  l  
  l       

Agenda

Ø Smart home security introduction Ø Tradtional attack in IoT Ø Our advanced approach Ø Case of some vulnerabilities Ø Q&A

Smart home security introduction
Ø Smart home architecture Ø Vulnerability in IoT Device

IoTBridge With Cloud
Server

IoTBridge Without Cloud Server

 


 

· "!%! 
· 
#!#"!! !& · !  "!%  !#
· 
"!%
· ! ! '
!!#%!( # 
· ! 
$! "$%

 


 

·      ·     ·  

   
  
 ·  
   
 

Tradtional attack in IoT
Ø Attack target device Ø Single point attack in IoT devices with more intelligent action · Smart Tv ,Smart Router,Smart Speaker and etc... Ø Combined Attack in IoT devices with gateway dependency · Smart lamp,Smart adapt,Smart cleaner robot,Smart lock and etc...

Tradtional attack in IoT
Ø Common Attack Approach
Ø Heap or Stack Overflow attack Ø Command Inject Ø Android/Linux N-Day CVE Ø External IP and sensitive interface exposure

Some New Attack Approach
Ø Why a url?
Ø As a trap to attack more concealed
Ø What can a url do?
Ø Gain control of IoT in some way
Ø Some Attack Surface
Ø Attack IoT bridge protocol Ø Security in brain App of IoT Ø More ...

 

· 
#*'##!"$$"#(%',
· +$# ' #%"$$

 

&%

#*" # $ # 

'&%"#

#!!" #)

%"$$

#"'
"# & #(&


$' &

#%

('#%-'#" &

"##' #"'%#

''"'%,

')#*'

$$(%',"

#(%',&

 

· 
       
·  

Url Attack Smart Home

 

· 





· 

Ø 
 Ø 

 Ø 

· 





·  

 · 

 · 
 


 

RCE From RemoteUrl

Url Entry

DNS-Rebinding

App scheme

Brain App to manage IoT

Open-Port Upnp Action WebSocket Fuzz-Data Inject code RCE IoT Device ......

Private Network

Ø Attack open-port to get protocal type Ø Analyze sensitive action or exposed interface Ø Inject backdoor to access persisting RCE attack

Step 1

Step 2

Pwned

Attack Surface Browser/Url App/Url

Victim with backdoor

Private Network

Smart Tv = Backdoor?

Cases Study
Ø Smart Tv attack case Ø GeekPwn hacker-house case

Attack Smart Tv
Case 1
ØExpose some Interface with no authorization ØBasically DLNA screen-mirroring ØInject backdoor into Tv

Attack Smart Tv
Case 1
ØDangerous Upnp Action ØRemote Download->Install App->Launch App ØAttacker hjacked private network

Attack Smart Tv
Case 2
ØWeak App Code Protection ØCommunicate with Tv with no authorization ØRemote attack Smart Tv imitate Center App Action

GeekPwn hacker-house case
Ø A mini simulating smart home Ø Pwn all of IoT devices in this virturl house Ø Attack and hack IoT device from center brain app Ø Expand and exploit JSAPI ability to access smart home control Ø Achieve persistence and concealed

Attack Remote Url

Private-Network Mobile Phone

Hacker-House

Lamp

Speaker

HackerHouse Case 1

Smart Tv Robotic Cleaner SmartLock

Router

Camera

ØAnalyze and Choose Attack Surface ØPwn target devices with obvious showing

Hacker-
House Case 2

XSS JSAPI

On/Off

Smart Tv Install BackDoor

Lamp Move
Robotic Cleaner

Dns-Hjack

Token DisClouse

Brain App

Mobile Phone

Oauth Router Risk
Speaker BLE Attack
SmartLock

Camera Get Talk Record Remote Playing Music
Remote Opening Door

Hacker-
House Case 3

Brain App

Mobile Phone Vulnerability source

Smart Tv

Router

Speaker Vulnerability diffusion

Robotic Cleaner Lamp

Camera

SmartLock Vulnerability sink

Conclusion
Ø We have found about 50 0-Day vulnerabilities in famous IoT Vendor within two month
Ø Code Execution Ø Remote Contorl Ø Information Disclouse Ø Permanent denial of service
Ø We were ranked #1 in GeekPwn Hacker-House in 2018

Q&A
THANKs
Han Zidong@tencent

