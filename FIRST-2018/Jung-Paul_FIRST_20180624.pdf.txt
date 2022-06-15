A little tour in the little world of passwords stealers
Paul Jung CERT - XLM
TLP:White

2
What is a PWS
Av's industry says... · PassWord Stealer · PaSsWord · Information Stealer
FIRST'2018

3
What can it steal ?
· Credentials in browser · Credentials in configuration files/registry · Coin Wallets · Serial numbers
Everything mainly in user land without auth. FIRST'2018

4
What can it steal ?
FIRST'2018

5
PWS Objectives
Optionally... · Grab screenshots · Key logging
FIRST'2018

6
How it works (usually)
· Buy the tool, or find an open / cracked one
FIRST'2018

7
How it works (usually)
· Forums or Yt are full of nice ads...
FIRST'2018

8
How it works (usually)
· Forums are full of nice ads...
FIRST'2018

9
How it works (usually)
· Forums are full of nice ads...
FIRST'2018

10
How it works (usually)
· Forums are full of nice ads...
FIRST'2018

11
How it works (usually)
· Forums are full of nice ads...
FIRST'2018

12
How it works (usually)
· And they're plenty of those.
FIRST'2018

13
Plenty of those...
FIRST'2018

14
Plenty of those...
FIRST'2018

15
How it works (usually)
· Composants · Builder
FIRST'2018

16
How it works (usually)
· Composants · Builder
FIRST'2018

17
How it works (usually)
FIRST'2018

18
How does it comes
(usually)
FIRST'2018

19
Panel
· A couple of them need a php panel
FIRST'2018

20
Quality is not constant
· JPro Crack Stealer · Predator Pain · Pony · AutoLog · Agent Tesla
FIRST'2018

21
JPro Crack

The "opportunistic" one

FIRST'2018

cffa3423bc5709d873fe8bf3a813e50e6315d8c716c5817c20669bc3d94bbecb

22
JPro Crack
· Diagnostic wallet for truck engine · From Noregon · Cracks are available on forums · Not all cracks are working well
FIRST'2018

23
JPro Crack
· Steal creds · Firefox · Google Chrome · Opera Browser · Pidgin · Thunderbird · FileZilla · Proxifier
FIRST'2018

24
JPro Crack
· Detect av's and firewall through WMI · root\SecurityCenter · SELECT * FROM FirewallProduct · SELECT * FROM AntiVirusProduct
FIRST'2018

25
JPro Crack
· Report in clear txt · in an ugly way
FIRST'2018

26
JPro Crack
FIRST'2018

27
JPro Crack
FIRST'2018

28
Pony
The most "Famous"
FIRST'2018

29
Pony
FIRST'2018

30
Pony
· Named by Kaspersky and Microsoft as FareIT · In the field since 2011, multiple versions · Code is "open" now · Builder in Delphi · Stealer in Assembler (MASM)
FIRST'2018

31
Pony
· Used often as dropper · Try credentials to brute force local accounts
FIRST'2018

32
Pony
131
FIRST'2018

33
Pony
· Reports to "gate.php" using POST
· Ua by default
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/5.0)"
· Basic security to avoid detection
...
{ if (strlen($received_report_data) == 0) { // received empty report // return 404 $pony_db->add_log_line(`NOTIFY_GATE_RECEIVED_NULL_REPORT', CLOG_SOURCE_GATE, null, $ip); header('HTTP/1.0 404 Not Found'); header('Status: 404 Not Found'); $_SERVER['REDIRECT_STATUS'] = 404; if (file_exists('404.html')) echo file_get_contents('404.html'); die(); }
FIRST'2018

34
Predator Pain
The"Laziest"
aaeb4d11b5d9b558c6e0883edd0b9a06131a5c19
FIRST'2018

35
Predator Pain
· In the field since 2008, multiple versions · Written in .net · Could report in http, smtp and ftp
FIRST'2018

36
Predator Pain

· Does not retrieve anything by itself !
[17:59]:[~/predator_pain/pp]\::: $decrottePE.py sample.exe [i] Scanning sample.exe
>Seeking / Searching for PE [*] Found PE_0.exe 517632 bytes saved
>Seeking - Searching for PE [*] Found PE_20804.exe 6656 bytes saved
>Seeking / Searching for PE [*] Found PE_27465.exe 345600 bytes saved
>Seeking | Searching for PE [*] Found PE_379310.exe 98816 bytes saved
>Seeking / Searching for PE

Predator Pain .net

cmemoryexecute.dll .net

Mail PassView Gui PE

WebBrowserPassView Gui PE

FIRST'2018

37
Predator Pain
FIRST'2018

38
Predator Pain
· It loads and executes recovery tools from memory
FIRST'2018

39
Predator Pain
· Configuration is ciphered with DES/AES · It reports with "GET"
[URI]?fname=[FILENAME]&data=[DATA]
FIRST'2018

40
AutoLog
Another "less Lazy"
f262026b132ff7927914d3986347caf11c97b183
FIRST'2018

41
AutoLog
· In the field since 2016 · Autolog is written in AutoIT · Seen packed in .NET · Painfull as a Javascript :)
FIRST'2018

42
AutoLog
Obfuscated AutoIT code Data file
FIRST'2018

43
AutoLog
Global $a536080041c = a4600006061($cw[1]), $a1a60a05f4c = a4600006061($cw[2]), $a0660b02754 = a4600006061($cw[3]), $a5e60c01e15 = a4600006061($cw[4]), $a2460d0140a = a4600006061($cw[5]), $a1660e03a06 = a4600006061($cw[6]), $a1560f02d5e = a4600006061($cw[7]), $a2e70000721 = a4600006061($cw[8]), $a3270202010 = a4600006061($cw[9]), $a397040024d = a4600006061($cw[10]), $a507060060e = a4600006061($cw[11]), $a0870800826 = a4600006061($cw[12]), $a1970a04f0b = a4600006061($cw[13]), $a4270c06247 = a4600006061($cw[14]), $a5470e03d0a = a4600006061($cw[15]), $a2b80001d00 = a4600006061($cw[16]), $a108020631a = a4600006061($cw[17]), $......
FIRST'2018

44
AutoLog
Obfuscated AutoIT code
Data file
Func a4600006061($a4600006061) Local $a4600006061_ For $x = 1 To StringLen($a4600006061) Step 2 $a4600006061_ &= Chr(Dec(StringMid($a4600006061, $x, 2))) Next Return $a4600006061_
EndFunc
FIRST'2018

45

AutoLog

Obfuscated AutoIT code

· Autoit has an eval() function

Data file

$a5ef8203511 = Execute($a59f8303224) & $a15f8403357 & Execute($a1bf8506331) & $a51f860605b & Execute($a3af8701028) & $a63f8805a42 & Execute($a57f890304f) & $a15f8a01c39 & Execute($a38f8b00c32) & $a1ff8c01c1b & Execute($a10f8d04920)
FIRST'2018

46
AutoLog
· Autolog takes regular screenshots · Nice colourful key logger logs · Communicates via SMTP · AutoIT allows direct API call
· It logs keys by using Dllcallback bind on keypress
FIRST'2018

47
AutoLog
Also Check for virtualisation by looking processes :
if ProcessExists(a3a6050431b(a5a60605046($a0d1c701d59))) Then Exit ;
· VboxService.exe · VMwaretray.exe · vpc.exe · VBoxTray.exe · VmWareTools.exe · VmwareService.exe · VBoxexe
FIRST'2018

48
AutoLog
· Autolog does not retrieve passwords by itself · Autolog downloads and uses "lazagne"
https://github.com/AlessandroZ/LaZagne
FIRST'2018

49
Agent Tesla
The"professional"
4d9baf06a89e1109d8d2ac3fc4855be6e648c5bd
FIRST'2018

50
Agent Tesla
· Agent tesla is simply sold online
FIRST'2018

51
Agent Tesla
· But agent tesla is not a malware !!
FIRST'2018

52
Agent Tesla
· But agent tesla is not a malware !!
FIRST'2018

53
Agent Tesla
· Buy online in Bitcoin/Perfect money $12/m, $69/y · .Net code · Reports in smtp, ftp and http · Builder is auto updating · Crypter is part of the package (another painfull .net) · Macro based dropper is also part of the package FIRST'2018

54
Agent Tesla
· POST to "api.php" · Steals 33 applications · Grab screens · Decoy Messages
FIRST'2018

55
Agent Tesla
· Every string is ciphered using Industry standard. · PBKDF1 SHA1 Password derivation · using API .getbytes to upgrade key from 20 to 32 bytes. · AES 256 CBC
FIRST'2018

56
Agent Tesla
· It's quite hard to audit the panel
· protected by Ioncube
<?php //0046b if(!extension_loaded('ionCube Loader')){$__oc=strtolower(substr(php_uname(),0,3));$__ln='ioncube_loader_'. $__oc.'_'.substr(phpversion(),0,3).(($__oc=='win')?'.dll':'.so');if(function_exists('dl')){@dl($__ln);} if(function_exists('_il_exec')){return _il_exec();}$__ln='/ioncube/'.$__ln; $__oid=$__id=realpath(ini_get('extension_dir'));$__here=dirname(__FILE__);if(strlen($__id)>1&&$__id[1]==':') {$__id=str_replace('\\','/',substr($__id,2));$__here=str_replace('\\','/',substr($__here,2));} $__rd=str_repeat('/..',substr_count($__id,'/')).$__here.'/';$__i=strlen($__rd);while($__i--){if($__rd[$__i]=='/') {$__lp=substr($__rd,0,$__i).$__ln;if(file_exists($__oid.$__lp)){$__ln=$__lp;break;}}}if(function_exists('dl')) {@dl($__ln);}}else{die('The file '.__FILE__." is corrupted.\n");}if(function_exists('_il_exec')){return _il_exec();} echo('Site error: the file <b>'.__FILE__.'</b> requires the ionCube PHP Loader '.basename($__ln).' to be installed by the website operator. If you are the website operator please use the <a href="http://www.ioncube.com/lw/">ionCube Loader Wizard</a> to assist with installation.');exit(199);
?> HR+cPwGjn/1rPF/Pnm0gKjFX5P2G2SH4P7LUHPMuqADx5/THG5pr1ar0LnOQAj92BSKHTYmjvaUM SdfUPkAVvKeo7RgJwXE8rZe9UVXen5Wf7xqfHDX/TLyfFbbd9zl3YNUCYqnk/cNEbjBa+lHKSMev umxDRbtZoker18qCALWMP8yf4JjAVLqwUV2d7E8TiPQ3L9/Gq2bkylL2NoIr4l7TdBrlaLYIe7A2 LtsfGtff6WR7GpGe3zaFsWWWvuK1ttFBtDaIYxYV6xBY/yWjoesuDbNHZavbP1ZHV3sa6sdXq6Gm 1j4iJcASZwcVttvSS5Qg7t5qwPH7+SpYFmvdjbtYDIzugCNFJZCUvCjSRXC+OcN0x/rZ10deT/ho 5IqhTmbtTOb6YIPiTFVSanEl5KEz2ocvKup/Oh2v5BAlBvRU6RygNPZwZ/1IEwhjzmkRTEAGJyK5
FIRST'2018

57
Agent Tesla
· Luckily, security on panels is often weak... /Screens
ç
FIRST'2018

58
Agent Tesla
Last version : https://www.agenttesla.com/version.html 3.2.52
FIRST'2018

59
Agent Tesla
FIRST'2018

60
Agent Tesla
FIRST'2018

61
Detection
FIRST'2018

62
Classification
FIRST'2018

63
Classification
· A lot of yara rules already exist · https://github.com/Yara-Rules/rules · https://github.com/Th4nat0s/Yaramoi
· Need to be unpacked first !
FIRST'2018

64
Classification
· Auto unpack · 32 bits · RUNPE
https://github.com/Th4nat0s/Chall_Tools/blob/master/malwares/unpack_runpe.py
FIRST'2018

65
Classification
I hate .NET packers !!! · Start > No Break > Debug > Modules
.net
FIRST'2018

66
Classification
· RunPE ! nice

.net

.net

FIRST'2018

67
Classification
· RunPE ! nice... UPX... nice
$file out.exe out.exe: PE32 executable (GUI) Intel 80386, for MS Windows, UPX compressed

.net

.net

UPX

FIRST'2018

68
Classification
· Arghhh

.net

.net

FIRST'2018

UPX

AutoIT

69
Post Detection
· Some panels are easy to spot in your logs · KEYBASE
· GET POST.PHP?TYPE=...&MACHINENAME=...
· LOKIBOT · POST FRE[D]?[.]PHP · UA : (Charon; Inferno)
FIRST'2018

70
Post Detection
· DIAMOND FOX, PONY, HANCITOR or... ? · GATE.PHP
FIRST'2018

71
Post Detection
· Most of them share the admin and reports · Pony, Lockybot, Tesla etc... do that
FIRST'2018

72
Post Detection
· Most of them share the admin and reports · Pony, Lockybot, Tesla etc... do that
$./c2id.py seek -u http://www.ctrhelpdesk.com/admin/Panel/five 2018-06-20 22:57:34,437 :: INFO :: No Root page found, bruteforcing 2018-06-20 22:58:03,158 :: INFO :: Found Locky Bot at 100%
https://github.com/Th4nat0s/c2id
FIRST'2018

73
Post Detection
· Most of them share the admin and reports
· Pony, Lockybot, Tesla etc... do that
$cat pony2.yaml name: pony 2.2 root: admin.php, gate.php rule:
- page: config.php code: 200
- page: gate.php code: 404
- page: admin.php code: 200
- page: 'includes/templates/header.tpl' code: 200 contains: '<div class="pony_hdr_text">Pony 2.2'
- page: 'includes/design/images/favicon.ico' code: 200 hash: b2e87bb6f28663fe5d28dec0d980d4cb
FIRST'2018

74
Thank's
Thanks to all guys who track panels and have fun with it !
If you need/have info on stealer ping us cert@excellium-services.com
www.excellium-services.com
@_ _Thanat0s_ _
FIRST'2018

