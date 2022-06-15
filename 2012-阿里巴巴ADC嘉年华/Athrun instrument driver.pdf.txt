Athrun Instrument Driver


Athrun
· Athrun
­  ­ / ­ Android / iOS ­ run
· Open source at
­

Android



 

 

iOS

instrument js 


Instrument Driver

Athrun

IOS
· AppFramework
­ 
· didFinishLaunchingWithOptions ·  · touch
­ 
· iOS · Objective-C
­ 
·  ·  · Objective-C

IOS
· instrument js 
­ UIAutomation
·  · iOS 4.0
­ UIAutomation
·  ·  · LogHudson
­ UIAutomation
·  ·  ·  · 

IOS
· InstrumentDriver
­ 
· java · junit
­ 
·  ·  · 

InstrumentDriver 

API

· API
­ UI ­  ­ UIAutomation ­ 
· 
­ UIATarget
· static localTarget() · printElementTree · scrollUp/Down/Left/Right · frontMostApp
­ UIAApplication

· alert · keyboard · UIANavigationBar · mainWindow · win=UIATarget.localTarget().f
rontMostApp().mainWindow()
­ UIAWindow(win)
· UIAElement
­ UIAElement
· elements · T findElementByText(String
text, Class<T> elmentType) · tap · touchAndHold


@Test public void Demo1() throws Exception {
win.printElementTree(); win.findElementByText("Demo 1").touchAndHold(); UIAElement[] eles = win.elements(); System.out.println(eles.length); win.findElementByText("name", UIATextField.class).setValue("athrun"); win.secureTextFields()[0].tap(); app.keyboard().typeString("abcdefg\\n"); win.findElementByText("Hello Tao").tap(); assertEquals("Hello,athrun!", win.staticTexts()[3].name()); }



Demo
· Demo
­ Demo-InstrumentDriver.mov



Feature List
Open Source Depends On OS Version Test Script Language OO style API Design Test Release APP WebView Automation Continuous Integration Remote Control Record And Playback Server Data Preparation Debug while running Embedded Data-Driven

Instrument Driver

Instrument > iOS4
Java/Any        
-

UI Automation
Instrument
> iOS4 js    

-

Fone Monkey

Inject All UI/js 
 



iOS NativeDriver

inject All Any 
  
 
-


· Todo List
­  ­ DebugIDE ­ MacWindows
· 
­ http://code.taobao.org/p/athrun/wiki/index/ ­ Welcome To
· Notify bug · Make suggestion · Send patch

